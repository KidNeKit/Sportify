class ExerciseRep {
  final String name;

  ExerciseRep({required this.name});

  ExerciseRep.copy({required ExerciseRep rep}) : name = rep.name;

  ExerciseRep copyWith({String? name}) {
    return ExerciseRep(name: name ?? this.name);
  }

  @override
  String toString() {
    return 'name = $name';
  }
}
