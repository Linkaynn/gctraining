// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExercisesStore on _ExercisesStore, Store {
  final _$exercisesAtom = Atom(name: '_ExercisesStore.exercises');

  @override
  List<Exercise> get exercises {
    _$exercisesAtom.reportRead();
    return super.exercises;
  }

  @override
  set exercises(List<Exercise> value) {
    _$exercisesAtom.reportWrite(value, super.exercises, () {
      super.exercises = value;
    });
  }

  final _$exercisesFilteredAtom =
      Atom(name: '_ExercisesStore.exercisesFiltered');

  @override
  List<Exercise> get exercisesFiltered {
    _$exercisesFilteredAtom.reportRead();
    return super.exercisesFiltered;
  }

  @override
  set exercisesFiltered(List<Exercise> value) {
    _$exercisesFilteredAtom.reportWrite(value, super.exercisesFiltered, () {
      super.exercisesFiltered = value;
    });
  }

  final _$exercisesSelectedAtom =
      Atom(name: '_ExercisesStore.exercisesSelected');

  @override
  List<Exercise> get exercisesSelected {
    _$exercisesSelectedAtom.reportRead();
    return super.exercisesSelected;
  }

  @override
  set exercisesSelected(List<Exercise> value) {
    _$exercisesSelectedAtom.reportWrite(value, super.exercisesSelected, () {
      super.exercisesSelected = value;
    });
  }

  final _$filtersAtom = Atom(name: '_ExercisesStore.filters');

  @override
  ExerciseFilters get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(ExerciseFilters value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ExercisesStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_ExercisesStoreActionController =
      ActionController(name: '_ExercisesStore');

  @override
  void filter() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.filter');
    try {
      return super.filter();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTagFilter(String tag) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.addTagFilter');
    try {
      return super.addTagFilter(tag);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTagFilter(String tag) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.removeTagFilter');
    try {
      return super.removeTagFilter(tag);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseExercisesAmount() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.increaseExercisesAmount');
    try {
      return super.increaseExercisesAmount();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseExercisesAmount() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.decreaseExercisesAmount');
    try {
      return super.decreaseExercisesAmount();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void randomSelection() {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.randomSelection');
    try {
      return super.randomSelection();
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelectedExercise(Exercise exercise) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.toggleSelectedExercise');
    try {
      return super.toggleSelectedExercise(exercise);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelectedExercise(Exercise exercise) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.addSelectedExercise');
    try {
      return super.addSelectedExercise(exercise);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedExercise(Exercise exercise) {
    final _$actionInfo = _$_ExercisesStoreActionController.startAction(
        name: '_ExercisesStore.removeSelectedExercise');
    try {
      return super.removeSelectedExercise(exercise);
    } finally {
      _$_ExercisesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exercises: ${exercises},
exercisesFiltered: ${exercisesFiltered},
exercisesSelected: ${exercisesSelected},
filters: ${filters}
    ''';
  }
}
