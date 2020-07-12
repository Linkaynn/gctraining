import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gctraining/models/exercise.dart';
import 'package:gctraining/models/exercise_filters.dart';
import 'package:gctraining/store/m_store.dart';
import 'package:mobx/mobx.dart';

part 'exercises_store.g.dart';

class ExercisesStore = _ExercisesStore with _$ExercisesStore;

class ExercisesStoreKeys {}

abstract class _ExercisesStore extends MStore with Store {
  @observable
  List<Exercise> exercises = [];

  List<Exercise> exercisesFiltered = [];

  @observable
  ExerciseFilters filters = ExerciseFilters();

  @action
  Future<void> init() async {
    this.isLoading = true;

    exercises = [];

    QuerySnapshot snapshot = await Firestore.instance.collection('exercises_v1').getDocuments();

    for (DocumentSnapshot document in snapshot.documents) {
      Exercise exercise = Exercise.fromJson(document.data);

      exercise.id = document.documentID;

      this.exercises.add(exercise);
    }

    this.filter();

    this.isLoading = false;
  }

  @action
  void filter() {
    this.exercisesFiltered = filters.filter(this.exercises);
    this.refresh();
  }

  @action
  void addTagFilter(String tag) {
    if (!filters.tags.contains(tag)) {
      filters.tags.add(tag);
      this.filter();
    }
  }

  @action
  void removeTagFilter(String tag) {
    filters.tags.remove(tag);
    this.filter();
  }
}
