import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'enums/muscle_groups.dart';

class Exercise extends Equatable {
  final String _name;
  final List<MuscleGroups> _pGroups;
  final List<MuscleGroups>? _sGroups;

  const Exercise(
      {required String name,
      required List<MuscleGroups> pGroups,
      List<MuscleGroups>? sGroups})
      : _name = name,
        _pGroups = pGroups,
        _sGroups = sGroups;

  String get name {
    return _name;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
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
        pGroups: groups
            .map((e) => MuscleGroups.values.byName(e.toString()))
            .toList());
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  List<Object?> get props => [_name, _pGroups, _sGroups];
}
