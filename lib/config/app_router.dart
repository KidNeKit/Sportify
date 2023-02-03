import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';
import '../repositories/auth_repository.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/registration_screen.dart';
import '../view/screens/exercise_creation_screen/exercise_creation_screen.dart';
import '../view/screens/exercise_screen/exercise_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/navigation_screen/navigation_screen.dart';
import '../view/screens/onboarding_screen/onboarding_screen.dart';
import '../view/screens/splash_screen.dart';
import '../view/screens/workout_template_creation_screen/workout_templatE_creation_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case NavigationScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const NavigationScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (ctx) => BlocProvider(
                  create: (ctx) =>
                      LoginCubit(authRepository: ctx.read<AuthRepository>()),
                  child: const LoginScreen(),
                ));
      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const RegistrationScreen());
      case OnboardingScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const OnboardingScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case ExerciseScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => const ExerciseScreen(),
        );
      case ExerciseCreationScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => ExerciseCreationScreen(),
        );
      case WorkoutTemplateCreationScreen.routeName:
        return MaterialPageRoute(
          builder: (ctx) => const WorkoutTemplateCreationScreen(),
        );
      default:
        return null;
    }
  }
}
