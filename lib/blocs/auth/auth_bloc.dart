import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    _userSubscription = _authRepository.user
        .listen((firebaseUser) => add(AuthUserChanged(user: firebaseUser)));
    on<AuthUserChanged>(_onAuthUserChanged);
    on<LogOutRequested>(_onLogOutRequested);
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    log('{Auth Bloc} Loaded User: ${event.user}');
    emit(event.user != null
        ? AuthState.authenticated(user: event.user)
        : const AuthState.unauthenticated());
  }

  void _onLogOutRequested(LogOutRequested event, Emitter<AuthState> emit) {
    log('{Auth Bloc} Log out...');
    unawaited(_authRepository.logOut());
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription!.cancel();
    return super.close();
  }
}
