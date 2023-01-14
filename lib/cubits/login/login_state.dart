part of 'login_cubit.dart';

enum LoginStatus { initial, processing, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final String? emailError;
  final String? passwordError;

  const LoginState.initial()
      : email = '',
        password = '',
        status = LoginStatus.initial,
        emailError = null,
        passwordError = null;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      this.emailError,
      this.passwordError});

  LoginState copyWith(
      {String? email,
      String? password,
      LoginStatus? status,
      String? emailError,
      String? passwordError}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, status, emailError, passwordError];
}
