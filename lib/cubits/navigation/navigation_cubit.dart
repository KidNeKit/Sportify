import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/nav_icon.dart';
import '../../view/screens/exercise_screen/exercise_screen.dart';
import '../../view/screens/home_screen/home_screen.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(index: 0));

  void changeScreen(int index) {
    emit(state.copyWith(index: index));
  }
}
