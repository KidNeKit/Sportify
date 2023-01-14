import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  String? emailError;
  String? passwordError;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState.initial());

  void emailChanged(String email) {
    emit(state.copyWith(
        email: email, emailError: emailError, passwordError: passwordError));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(
        password: password,
        emailError: emailError,
        passwordError: passwordError));
  }

  void signIn() async {
    _validateEmail();
    _validatePassword();
    if (emailError != null || passwordError != null) {
      emit(
          state.copyWith(emailError: emailError, passwordError: passwordError));
    } else {
      emit(state.copyWith(status: LoginStatus.processing));
      try {
        await _authRepository.signIn(
            email: state.email, password: state.password);
        emit(state.copyWith(status: LoginStatus.success));
      } catch (e) {
        emailError = 'An error due login on firebse side';
        emit(state.copyWith(status: LoginStatus.error, emailError: emailError));
      }
    }
  }

  void _validateEmail() {
    String email = state.email;
    if (email.isEmpty) {
      emailError = 'Email should be filled';
    } else {
      emailError = null;
    }
  }

  void _validatePassword() {
    String password = state.password;
    if (password.isEmpty) {
      passwordError = 'Password should be filled';
    } else if (password.length < 8) {
      passwordError = 'Password length should be more than 8 characters';
    } else {
      passwordError = null;
    }
  }
}
