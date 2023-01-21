import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/view/screens/exercise_creation_screen/exercise_creation_screen.dart';

import 'enums/muscle_groups.dart';

class Exercise extends Equatable {
  final String _name;
  final ExerciseMeasure _measure;
  final List<MuscleGroups> _pGroups;
  final List<MuscleGroups>? _sGroups;
  final double? _kcal;

  const Exercise(
      {required String name,
      required ExerciseMeasure measure,
      required List<MuscleGroups> pGroups,
      List<MuscleGroups>? sGroups,
      double? kcal})
      : _name = name,
        _measure = measure,
        _pGroups = pGroups,
        _sGroups = sGroups,
        _kcal = kcal;

  String get name {
    return _name;
  }

  List<MuscleGroups> get pGroups {
    return _pGroups;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'kcal': _kcal,
      'measure': _measure.toString(),
      'pGroups': _pGroups.map((e) => e.toString()).toList(),
      'sGroups': _sGroups
    };
  }

  static Exercise fromFirestore(DocumentSnapshot snapshot) {
    List<dynamic> groups = snapshot.data().toString().contains('pGroups')
        ? snapshot['pGroups']
        : [];
    return Exercise(
        name: snapshot['name'],
        kcal: snapshot.data().toString().contains('kcal')
            ? snapshot['kcal']
            : null,
        measure: ExerciseMeasure.values.byName(snapshot['measure']),
        pGroups: groups
            .map((e) => MuscleGroups.values.byName(e.toString()))
            .toList());
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  List<Object?> get props => [_name, _pGroups, _sGroups, _kcal, _measure];
}
