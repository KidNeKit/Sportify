import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_state.dart';

enum RegistrationStatus { processing, successful }

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(const RegistrationState.initial());

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
    log(state.email);
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
    log(state.password);
  }

  void signup() async {
    emit(RegistrationState(
        email: state.email,
        password: state.password,
        status: RegistrationStatus.successful));
  }
}
