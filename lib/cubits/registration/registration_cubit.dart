import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthRepository _authRepository;
  RegistrationCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegistrationState.initial()) {
    log('registration cubit created');
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
    log(state.email);
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
    log(state.password);
  }

  void signup() async {
    try {
      emit(state.copyWith(status: RegistrationStatus.processing));
      // await _authRepository.signUp(
      //     email: state.email, password: state.password);
      // emit(state.copyWith(status: RegistrationStatus.success));
      emit(state.copyWith(status: RegistrationStatus.initial));
    } catch (_) {}
  }
}
