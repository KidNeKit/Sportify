import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../repositories/auth_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository _authRepository;

  UserCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const UserState.initial());

  void changeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void changeUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void changeHeight(String height) {
    emit(state.copyWith(height: double.tryParse(height)));
  }

  void changeWeight(String weight) {
    emit(state.copyWith(weigth: double.tryParse(weight)));
  }

  void signup() async {
    try {
      emit(state.copyWith(status: UserStatus.processing));
      User user = User.creation(
          email: state.email,
          username: state.username,
          weight: state.weight,
          height: state.height);
      await _authRepository.signUp(newUser: user, password: state.password);
      emit(state.copyWith(status: UserStatus.success));
    } catch (_) {}
  }
}
