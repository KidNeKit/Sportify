import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState.initial());

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
    log(state.email);
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
    log(state.password);
  }

  void signIn() async {
    emit(state.copyWith(status: LoginStatus.processing));
    try {
      await _authRepository.signIn(
          email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }
}
