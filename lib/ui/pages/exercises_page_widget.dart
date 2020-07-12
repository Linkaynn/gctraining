import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gctraining/models/exercise.dart';
import 'package:gctraining/store/exercises_store.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p1.dart';
import 'package:gctraining/ui/widgets/exercise_widget.dart';
import 'package:provider/provider.dart';

class ExercisesPageWidget extends StatefulWidget {
  @override
  _ExercisesPageWidgetState createState() => _ExercisesPageWidgetState();
}

class _ExercisesPageWidgetState extends State<ExercisesPageWidget> {
  double APPBAR_HEIGHT = 50;

  @override
  Widget build(BuildContext context) {
    ExercisesStore exercisesStore = Provider.of<ExercisesStore>(context);

    return Observer(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(APPBAR_HEIGHT),
            child: AppBar(
              title: P1(text: "Ejercicios"),
            ),
          ),
          body: _buildBody(exercisesStore),
        ),
      );
    });
  }

  Widget _buildBody(ExercisesStore exercisesStore) {
    int itemsCount = exercisesStore.exercisesSelected.length;

    return Container(
      height: MediaQuery.of(context).size.height - APPBAR_HEIGHT - MediaQuery.of(context).padding.top,
      child: ListView.builder(
          itemCount: itemsCount,
          padding: EdgeInsets.all(KXTheme.sizes.quad),
          itemBuilder: (BuildContext context, int index) {
            Exercise exercise = exercisesStore.exercisesSelected[index];

            return Padding(
              padding: EdgeInsets.all(KXTheme.sizes.dou),
              child: ExerciseWidget(
                exercise: exercise,
                selected: false,
                onTap: (Exercise e) => exercisesStore.toggleSelectedExercise(e),
                onTagTap: (String tag) => exercisesStore.addTagFilter(tag),
              ),
            );
          }),
    );
  }
}
