import 'package:flutter/material.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/home/presentation/pages/home_shell.dart';

import '../../features/static_pages/presentation/pages/capaian_page.dart';
import '../../features/static_pages/presentation/pages/referensi_page.dart';
import '../../features/static_pages/presentation/pages/petunjuk_media_page.dart';
import '../../features/static_pages/presentation/pages/info_pengembang_page.dart';

import '../../features/chapters/presentation/pages/mole_chapter_prereq_page.dart';
import '../../features/chapters/presentation/pages/mole_chapter_map_page.dart';
import '../../features/chapters/presentation/pages/materi_page.dart';

import '../../features/quiz/presentation/pages/mastery_trial_page.dart';
import '../../features/quiz/presentation/pages/quiz_page.dart';
import '../../features/quiz/presentation/pages/quiz_result_page.dart';

import '../../features/feedback/presentation/pages/feedback_page.dart';
import '../../features/quiz/presentation/pages/adventure_page.dart';
import '../../features/quiz/presentation/pages/training_page.dart';

class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const home = '/home';

  static const capaian = '/capaian';
  static const referensi = '/referensi';
  static const petunjuk = '/petunjuk';
  static const infoPengembang = '/info-pengembang';

  static const moleChapterPrereq = '/mole-chapter-prereq';
  static const moleChapterMap = '/mole-chapter-map';
  static const materi = '/materi';

  static const masteryTrial = '/mastery-trial';
  static const quiz = '/quiz';
  static const quizResult = '/quiz-result';

  static const feedback = '/feedback';

  static const adventure = '/adventure';
  static const training = '/training';

  static const pretest = '/pretest'; // alias to quiz
}

class QuizArgs {
  const QuizArgs({
    required this.type,
    required this.materiId,
    required this.title,
    this.isMandatory = false,
  });

  final String type; // pretest, posttest, chapter_test, adventure, training
  final int materiId; // 0 for global
  final String title;
  final bool isMandatory;
}

class MateriArgs {
  const MateriArgs({required this.materiId});
  final int materiId;
}

class QuizResultArgs {
  const QuizResultArgs({
    required this.type,
    required this.materiId,
    required this.title,
    required this.correct,
    required this.total,
    required this.scorePercent,
  });

  final String type;
  final int materiId;
  final String title;
  final int correct;
  final int total;
  final int scorePercent;
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeShell());

      case AppRoutes.capaian:
        return MaterialPageRoute(builder: (_) => const CapaianPage());
      case AppRoutes.referensi:
        return MaterialPageRoute(builder: (_) => const ReferensiPage());
      case AppRoutes.petunjuk:
        return MaterialPageRoute(builder: (_) => const PetunjukMediaPage());
      case AppRoutes.infoPengembang:
        return MaterialPageRoute(builder: (_) => const InfoPengembangPage());

      case AppRoutes.moleChapterPrereq:
        return MaterialPageRoute(builder: (_) => const MoleChapterPrereqPage());
      case AppRoutes.moleChapterMap:
        return MaterialPageRoute(builder: (_) => const MoleChapterMapPage());
      case AppRoutes.materi:
        final args = settings.arguments as MateriArgs;
        return MaterialPageRoute(builder: (_) => MateriPage(args: args));

      case AppRoutes.masteryTrial:
        return MaterialPageRoute(builder: (_) => const MasteryTrialPage());

      case AppRoutes.pretest:
        return MaterialPageRoute(
          builder: (_) => QuizPage(
            args: const QuizArgs(type: 'pretest', materiId: 0, title: 'Pretest', isMandatory: true),
          ),
        );

      case AppRoutes.quiz:
        final args = settings.arguments as QuizArgs;
        return MaterialPageRoute(builder: (_) => QuizPage(args: args));

      case AppRoutes.quizResult:
        final args = settings.arguments as QuizResultArgs;
        return MaterialPageRoute(builder: (_) => QuizResultPage(args: args));

      case AppRoutes.feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackPage());

      case AppRoutes.adventure:
        return MaterialPageRoute(builder: (_) => const AdventurePage());

      case AppRoutes.training:
        return MaterialPageRoute(builder: (_) => const TrainingPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}