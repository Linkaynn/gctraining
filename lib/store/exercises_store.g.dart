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

  final _$initAsyncAction = AsyncAction('_ExercisesStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
exercises: ${exercises}
    ''';
  }
}