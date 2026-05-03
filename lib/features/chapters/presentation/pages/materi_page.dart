import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/core/config/routes.dart';
import 'package:mole_master/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_block.dart';
import 'package:mole_master/features/chapters/domain/entities/materi_progress.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_bloc.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_event.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_state.dart';
import 'package:mole_master/features/chapters/logic/utils/materi_unlock_logic.dart';
import 'package:mole_master/features/chapters/presentation/data/materi_data.dart';
import 'package:mole_master/features/chapters/presentation/widgets/materi/materi_renderer.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key, required this.args});
  final MateriArgs args;
  
  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  late final int materiId;
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    materiId = widget.args.materiId;
    _loadProgress();
  }
  
  Future<void> _loadProgress() async {
    final authState = context.read<AuthBloc>().state;
    final userId = authState.user?.id;
    
    if (userId != null) {
      final currentProgress = context.read<MateriBloc>().state.progress;
      if (currentProgress != null && currentProgress.userId == userId) {
        debugPrint('✅ Using cached progress for materi $materiId');
        setState(() => _isLoading = false);
        return;
      }
      
      debugPrint('🔄 Loading progress for materi $materiId');
      context.read<MateriBloc>().add(LoadMateriProgress(userId));
      setState(() => _isLoading = false);
    }
  }
  
  String? _getUserId() {
    return context.read<AuthBloc>().state.user?.id;
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<MateriBloc, MateriState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
        if (state.status != MateriStatus.loading && _isLoading) {
          setState(() => _isLoading = false);
        }
      },
      child: BlocBuilder<MateriBloc, MateriState>(
        builder: (context, state) {
          if ((state.status == MateriStatus.loading || _isLoading) && state.progress == null) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          
          final progress = state.progress;
          if (progress == null) {
            return const Scaffold(body: Center(child: Text('Gagal memuat progress')));
          }
          
          final unlockLogic = MateriUnlockLogic();
          final isUnlocked = unlockLogic.isUnlocked(
            materiId: materiId,
            currentMateri: progress.currentMateri,
            completedMateri: progress.completedMateri,
          );
          
          if (!isUnlocked) {
            return _buildLockedPage(context);
          }
          
          return _buildMateriContent(context, materiId, progress);
        },
      ),
    );
  }
  
  Widget _buildLockedPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terkunci'),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 80,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 24),
              Text(
                'Materi Terkunci',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Selesaikan materi sebelumnya terlebih dahulu untuk membuka materi ini.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Peta Belajar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMateriContent(BuildContext context, int materiId, MateriProgress progress) {
    final materiBlocks = _getMateriBlocks(materiId);
    final materiTitles = [
      'Definisi Awal dari "Mol"',
      'Ar dan Mr (Massa Atom dan Massa Molekul Relatif)',
      'Hubungan Mol ↔ Massa Molar',
      'Volume dan Hubungannya dengan Mol',
      'Perbandingan Volume (Reaksi Gas)',
      'Molaritas dan Hubungannya dengan Mol',
      'Jembatan Mol',
    ];
    final title = materiTitles[materiId - 1];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (progress.completedMateri.contains(materiId))
            Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(Icons.check_circle, color: Colors.green.shade400),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MateriRenderer(
                blocks: materiBlocks,
                primaryColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            _buildNavigationButtons(context, materiId, progress),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNavigationButtons(BuildContext context, int materiId, MateriProgress progress) {
    final totalMateri = 7;
    final unlockLogic = MateriUnlockLogic();
    
    final showPrevious = materiId > 1;
    
    final canGoToNext = unlockLogic.isUnlocked(
      materiId: materiId + 1,
      currentMateri: progress.currentMateri,
      completedMateri: progress.completedMateri,
    );
    final showNext = materiId < totalMateri && canGoToNext;
    
    final isCurrentCompleted = progress.completedMateri.contains(materiId);
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Tombol Previous
          if (showPrevious)
            Expanded(
              flex: 1,
              child: OutlinedButton.icon(
                onPressed: () {
                  _navigateToMateri(context, materiId - 1);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(''),
              ),
            ),
          
          if (showPrevious) const SizedBox(width: 6),
          
          // Tombol Post Test
          Expanded(
            flex: 3,
            child: FilledButton.icon(
              onPressed: () {
                _navigateToQuiz(context, materiId);
              },
              icon: const Icon(Icons.quiz_outlined),
              label: isCurrentCompleted 
                  ? const Text('Post Test Ulang')
                  : const Text('Post Test'),
            ),
          ),
          
          if (showNext) const SizedBox(width: 6),
          
          // Tombol Next
          if (showNext)
            Expanded(
              flex: 1,
              child: FilledButton.icon(
                onPressed: () {
                  _navigateToMateri(context, materiId + 1);
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text(''),
                iconAlignment: IconAlignment.end,
              ),
            ),
        ],
      ),
    );
  }
  
  List<MateriBlock> _getMateriBlocks(int id) {
    switch (id) {
      case 1:
        return MateriData.materi1();
      case 2:
        return MateriData.materi2();
      case 3:
        return MateriData.materi3();
      case 4:
        return MateriData.materi4();
      case 5:
        return MateriData.materi5();
      case 6:
        return MateriData.materi6();
      case 7:
        return MateriData.materi7();
      default:
        return [];
    }
  }
  
  void _navigateToMateri(BuildContext context, int newMateriId) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MateriPage(
          args: MateriArgs(materiId: newMateriId),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Slide + Fade combined
          const begin = Offset(0.3, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeOutQuart;
          
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          
          var fadeTween = Tween<double>(begin: 0.6, end: 1.0);
          var fadeAnimation = animation.drive(fadeTween);
          
          return FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }
  
  void _navigateToQuiz(BuildContext context, int materiId) {
    debugPrint('=== _navigateToQuiz CALLED ===');
    debugPrint('materiId: $materiId');
    
    final userId = _getUserId();
    debugPrint('userId from AuthBloc: $userId');
    
    if (userId == null) {
      debugPrint('❌ userId is NULL!');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User tidak ditemukan, silahkan login ulang')),
      );
      return;
    }
    
    debugPrint('✅ userId OK, navigating to quiz...');
    
    Navigator.pushNamed(
      context,
      AppRoutes.quiz,
      arguments: QuizArgs(
        type: 'chapter_test',
        materiId: materiId,
        title: 'Post Test Materi $materiId',
        isMandatory: true,
      ),
    ).then((_) {
      debugPrint('✅ Quiz finished, refreshing progress...');
      if (mounted) {
        _loadProgress();
      }
    }).catchError((error) {
      debugPrint('❌ Error: $error');
    });
  }
}