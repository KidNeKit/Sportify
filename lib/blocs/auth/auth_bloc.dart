import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:sportify/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    _userSubscription = _authRepository.user
        .listen((firebaseUser) => add(AuthUserChanged(user: firebaseUser!)));
    on<AuthUserChanged>(_onAuthUserChanged);
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    log('user loaded: ${event.user}');
    emit(AuthState.authenticated(user: event.user));
  }

  @override
  Future<void> close() {
    _userSubscription!.cancel();
    return super.close();
  }
}
