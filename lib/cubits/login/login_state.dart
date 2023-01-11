part of 'login_cubit.dart';

enum LoginStatus { initial, processing, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;

  const LoginState.initial()
      : email = '',
        password = '',
        status = LoginStatus.initial;

  const LoginState(
      {required this.email, required this.password, required this.status});

  LoginState copyWith({String? email, String? password, LoginStatus? status}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
