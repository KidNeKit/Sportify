import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/repositories/exercise_repository.dart';
import 'package:sportify/utils/themes.dart';

import 'blocs/auth/auth_bloc.dart';
import 'config/app_router.dart';
import 'repositories/auth_repository.dart';
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
      child: BlocProvider(
        create: (ctx) => AuthBloc(authRepository: ctx.read<AuthRepository>()),
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
