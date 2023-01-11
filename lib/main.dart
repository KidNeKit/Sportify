import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/config/app_router.dart';
import 'package:sportify/repositories/auth_repository.dart';
import 'package:sportify/view/screens/registration_screen.dart';

import 'blocs/auth/auth_bloc.dart';
import 'view/screens/home_screen.dart';

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
    return RepositoryProvider(
      create: (ctx) => AuthRepository(),
      child: BlocProvider(
        create: (ctx) => AuthBloc(authRepository: ctx.read<AuthRepository>()),
        child: MaterialApp(
          onGenerateRoute: _appRouter.onGenerateRoute,
          initialRoute: RegistrationScreen.routeName,
        ),
      ),
    );
  }
}
