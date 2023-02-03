part of 'user_cubit.dart';

enum UserStatus { initial, creation, modify, processing, success, error }

class UserState extends Equatable {
  final String id;
  final String email;
  final String username;
  final String password;
  final double height;
  final double weight;
  final UserStatus status;

  const UserState.initial()
      : id = '',
        email = '',
        username = '',
        password = '',
        height = 0.0,
        weight = 0.0,
        status = UserStatus.initial;

  const UserState({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.height,
    required this.weight,
    required this.status,
  });

  UserState copyWith({
    String? id,
    String? email,
    String? username,
    String? password,
    double? height,
    double? weigth,
    UserStatus? status,
  }) {
    return UserState(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      height: height ?? this.height,
      weight: weigth ?? this.weight,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [id, email, username, password, height, weight, status];
}
