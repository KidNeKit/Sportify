import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/user/user_cubit.dart';

import 'blocs/auth/auth_bloc.dart';
import 'config/app_router.dart';
import 'cubits/exercise_creation/exercise_creation_cubit.dart';
import 'cubits/navigation/navigation_cubit.dart';
import 'cubits/registration/registration_cubit.dart';
import 'repositories/auth_repository.dart';
import 'repositories/exercise_repository.dart';
import 'utils/themes.dart';
import 'view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (ctx) => AuthRepository()),
        RepositoryProvider(create: (ctx) => ExerciseRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) =>
                AuthBloc(authRepository: ctx.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (ctx) =>
                UserCubit(authRepository: ctx.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (ctx) =>
                RegistrationCubit(authRepository: ctx.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (ctx) => NavigationCubit(),
          ),
          BlocProvider(
            create: (ctx) => ExerciseCreationCubit(
                exerciseRepository: ctx.read<ExerciseRepository>()),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: _appRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          theme: ThemeData(
            inputDecorationTheme: tIntputDecorationTheme,
            textTheme: tTextTheme,
          ),
        ),
      ),
    );
  }
}
