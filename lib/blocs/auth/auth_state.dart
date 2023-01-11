part of 'auth_bloc.dart';

enum AuthStatus { unknown, unauthorized, authorized }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? user;

  const AuthState._({this.status = AuthStatus.unknown, this.user});

  const AuthState.unknown() : this._();

  const AuthState.authenticated({required this.user})
      : status = AuthStatus.authorized;

  const AuthState.unauthenticated() : this._(status: AuthStatus.unauthorized);

  @override
  List<Object?> get props => [status, user];
}
