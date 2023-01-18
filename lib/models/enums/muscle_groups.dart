import 'package:flutter/animation.dart';

import '../../utils/colors.dart';

enum MuscleGroups {
  chest('Chest', cChestColor),
  press('Press', cPressColor),
  shoulders('Shoulders', cShouldersColor),
  biceps('Biceps', cBicepsColor);

  final String label;
  final Color color;

  const MuscleGroups(this.label, this.color);

  Map<String, dynamic> toMap() {
    return {'label': label, 'color': color};
  }

  @override
  String toString() {
    return name;
  }
}
