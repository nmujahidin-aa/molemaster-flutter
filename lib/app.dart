import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/features/chapters/domain/repositories/materi_repository.dart';
import 'package:mole_master/features/chapters/logic/bloc/materi_bloc/materi_bloc.dart';
import 'package:mole_master/features/chapters/logic/utils/materi_unlock_logic.dart';

import 'core/config/app_theme.dart';
import 'core/config/routes.dart';

import 'features/auth/data/repositories/auth_repo_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

import 'features/progress/data/repositories/progress_repo_impl.dart';
import 'features/progress/domain/repositories/progress_repository.dart';
import 'features/progress/presentation/bloc/progress_bloc.dart';

import 'features/quiz/data/repositories/quiz_repo_impl.dart';
import 'features/quiz/domain/repositories/quiz_repository.dart';
import 'features/quiz/presentation/bloc/quiz_bloc.dart';

import 'features/feedback/data/repositories/feedback_repo_impl.dart';
import 'features/feedback/domain/repositories/feedback_repository.dart';
import 'features/feedback/presentation/bloc/feedback_bloc.dart';

import 'features/splash/presentation/bloc/splash_cubit.dart';

import 'package:mole_master/features/chapters/data/repositories/materi_repository_impl.dart';

class MoleMasterApp extends StatelessWidget {
  const MoleMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepoImpl(auth: auth, firestore: firestore),
        ),
        RepositoryProvider<ProgressRepository>(
          create: (_) => ProgressRepoImpl(firestore: firestore),
        ),
        RepositoryProvider<QuizRepository>(
          create: (_) => LocalQuizRepoImpl(),
        ),
        RepositoryProvider<FeedbackRepository>(
          create: (_) => FeedbackRepoImpl(firestore: firestore),
        ),
        RepositoryProvider<MateriRepository>(
          create: (_) => MateriRepositoryImpl(firestore),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => AuthBloc(ctx.read<AuthRepository>())
              ..add(const AuthObserveRequested()),
          ),
          BlocProvider(
            create: (ctx) => SplashCubit(
              authRepository: ctx.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (ctx) => ProgressBloc(ctx.read<ProgressRepository>()),
          ),
          BlocProvider(
            create: (ctx) => QuizBloc(ctx.read<QuizRepository>()),
          ),
          BlocProvider(
            create: (ctx) => FeedbackBloc(ctx.read<FeedbackRepository>()),
          ),
          BlocProvider<MateriBloc>(
            create: (ctx) => MateriBloc(
              repository: ctx.read<MateriRepository>(),
              unlockLogic: MateriUnlockLogic(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mole Master',
          theme: AppTheme.light(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRoutes.splash,
        ),
      ),
    );
  }
}