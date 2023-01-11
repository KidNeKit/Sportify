part of 'registration_cubit.dart';

enum RegistrationStatus { initial, processing, success, error }

class RegistrationState extends Equatable {
  final String email;
  final String password;
  final RegistrationStatus status;

  const RegistrationState.initial()
      : email = '',
        password = '',
        status = RegistrationStatus.initial;

  const RegistrationState(
      {required this.email, required this.password, required this.status});

  RegistrationState copyWith(
      {String? email, String? password, RegistrationStatus? status}) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
