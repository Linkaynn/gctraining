import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gctraining/models/exercise.dart';
import 'package:gctraining/models/exercise_filters.dart';
import 'package:gctraining/store/m_store.dart';
import 'package:gctraining/utils/m_shared_preferences.dart';
import 'package:mobx/mobx.dart';

part 'exercises_store.g.dart';

class ExercisesStore = _ExercisesStore with _$ExercisesStore;

class ExercisesStoreKeys {}

abstract class _ExercisesStore extends MStore with Store {
  @observable
  List<Exercise> exercises = [];

  @observable
  List<Exercise> exercisesFiltered = [];

  @observable
  List<Exercise> exercisesSelected = [];

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

    this.exercises.sort((a, b) => a.name.compareTo(b.name));

    this.filter();

    this.isLoading = false;
  }

  @action
  void filter() {
    this.exercisesFiltered = filters.filter(this.exercises);

    this.filters.amount = min(this.filters.amount, this.exercisesFiltered.length);

    this.refresh();
  }

  @action
  void addTagFilter(String tag) {
    if (!filters.tags.contains(tag)) {
      filters.tags.add(tag);
      this.filter();

      this._saveValues();
    }
  }

  @action
  void removeTagFilter(String tag) {
    filters.tags.remove(tag);
    this.filter();

    this._saveValues();
  }

  @action
  void increaseExercisesAmount() {
    filters.amount++;
    this.filter();

    this._saveValues();
  }

  @action
  void decreaseExercisesAmount() {
    filters.amount--;
    filters.amount = max(filters.amount, 0);

    this.filter();

    this._saveValues();
  }

  @action
  void randomSelection() {
    this.exercisesSelected = [];

    int amount = this.filters.amount;

    while (amount > 0) {
      Exercise randomExercise = this.exercisesFiltered[Random().nextInt(this.exercisesFiltered.length)];

      if (this.exercisesSelected.contains(randomExercise)) continue;

      this.exercisesSelected.add(randomExercise);
      amount--;
    }

    this.refresh();
  }

  @action
  void toggleSelectedExercise(Exercise exercise) {
    if (this.exercisesSelected.contains(exercise)) {
      this.removeSelectedExercise(exercise);
    } else {
      this.addSelectedExercise(exercise);
    }

    this.refresh();
  }

  @action
  void addSelectedExercise(Exercise exercise) {
    this.exercisesSelected.add(exercise);
    this.refresh();
  }

  @action
  void removeSelectedExercise(Exercise exercise) {
    this.exercisesSelected.remove(exercise);
    this.refresh();
  }

  void _saveValues() {
    MSharedPreferences.setString(MSharedPreferencesKeys.TAGS, filters.tags.join(','));
    MSharedPreferences.setString(MSharedPreferencesKeys.AMOUNT, filters.amount.toString());
  }
}
