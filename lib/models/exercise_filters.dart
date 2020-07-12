import 'package:gctraining/models/exercise.dart';

class ExerciseFilters {
  List<String> tags = [];
  int amount = 0;

  List<Exercise> filter(List<Exercise> exercises) {
    return exercises.where((exercise) {
      if (tags.isEmpty) return true;

      int counter = 0;

      for (String exerciseTag in exercise.tags) {
        for (String tag in tags) {
          if (tag == exerciseTag) counter++;
        }
      }

      return counter == tags.length;
    }).toList();
  }
}
