class ExerciseRep {
  final String name;

  ExerciseRep({required this.name});

  ExerciseRep.copy({required ExerciseRep rep}) : name = rep.name;

  ExerciseRep copyWith({String? name}) {
    return ExerciseRep(name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  String toString() {
    return 'name = $name';
  }
}
