import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gctraining/models/exercise.dart';
import 'package:gctraining/store/exercises_store.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/kx_icon.dart';
import 'package:gctraining/ui/atomic/atoms/kx_vertical_divider_widget.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p1.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p3.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p4.dart';
import 'package:gctraining/ui/atomic/molecules/kx_button.dart';
import 'package:gctraining/ui/widgets/exercise_widget.dart';
import 'package:gctraining/utils/m_shared_preferences.dart';
import 'package:provider/provider.dart';

class AllExercisesPageWidget extends StatefulWidget {
  @override
  _AllExercisesPageWidgetState createState() => _AllExercisesPageWidgetState();
}

class _AllExercisesPageWidgetState extends State<AllExercisesPageWidget> {
  double FILTER_HEIGHT = 60;
  double APPBAR_HEIGHT = 50;

  @override
  Widget build(BuildContext context) {
    if (!MSharedPreferences.initializated()) return Container();

    ExercisesStore exercisesStore = Provider.of<ExercisesStore>(context);

    return Observer(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(APPBAR_HEIGHT),
            child: AppBar(
              title: P1(text: _getAppBarText(exercisesStore)),
              actions: _getActions(exercisesStore),
            ),
          ),
          body: _buildBody(exercisesStore),
        ),
      );
    });
  }

  List<Widget> _getActions(ExercisesStore exercisesStore) {
    if (exercisesStore.exercisesSelected.isEmpty) return [];

    return [
      Padding(
        padding: EdgeInsets.only(right: KXTheme.sizes.quad),
        child: KXIcon(
          Icons.check,
          size: IconSize.big,
          color: KXTheme.colors.primaryComplementary,
          onTap: () {
            Navigator.pushNamed(context, 'exercises');
          },
        ),
      )
    ];
  }

  RenderObjectWidget _buildBody(ExercisesStore exercisesStore) {
    if (exercisesStore.isLoading) {
      return Center(child: Text('Cargando...'));
    }

    int itemsCount = exercisesStore.exercisesFiltered.length;

    return Column(
      children: [
        _buildFilters(exercisesStore),
        Container(
          height:
              MediaQuery.of(context).size.height - FILTER_HEIGHT - APPBAR_HEIGHT - MediaQuery.of(context).padding.top,
          child: RefreshIndicator(
            onRefresh: () => exercisesStore.init(),
            child: ListView.builder(
                itemCount: itemsCount,
                padding: EdgeInsets.all(KXTheme.sizes.quad),
                itemBuilder: (BuildContext context, int index) {
                  Exercise exercise = exercisesStore.exercisesFiltered[index];

                  return Padding(
                    padding: EdgeInsets.all(KXTheme.sizes.dou),
                    child: ExerciseWidget(
                      exercise: exercise,
                      selected: exercisesStore.exercisesSelected.contains(exercise),
                      onTap: (Exercise e) => exercisesStore.toggleSelectedExercise(e),
                      onTagTap: (String tag) => exercisesStore.addTagFilter(tag),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  String _getAppBarText(ExercisesStore exercisesStore) {
    if (exercisesStore.exercisesSelected.isEmpty) {
      return 'Todos los ejercicios';
    }

    return 'Todos los ejercicios\n${exercisesStore.exercisesSelected.length} ejercicio(s) seleccionados';
  }

  Container _buildFilters(ExercisesStore exercisesStore) {
    return Container(
      height: FILTER_HEIGHT,
      child: Padding(
        padding: EdgeInsets.only(left: KXTheme.sizes.units(7)),
        child: Row(
          children: [
            Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: KXTheme.sizes.triple),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      P3(
                        text: 'Etiquetas',
                        options: KXTextOptions(margin: EdgeInsets.only(bottom: KXTheme.sizes.dou)),
                      ),
                      _buildTagFilterInfo(exercisesStore)
                    ],
                  ),
                ),
                KXVerticalDividerWidget(height: FILTER_HEIGHT / 1.5, horizontalPadding: KXTheme.sizes.triple),
                Padding(
                  padding: EdgeInsets.only(right: KXTheme.sizes.triple),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      P3(
                        text: 'Cantidad',
                        options: KXTextOptions(margin: EdgeInsets.only(bottom: KXTheme.sizes.dou)),
                      ),
                      _buildAmountFilterInfo(exercisesStore)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: KXTheme.sizes.triple, left: KXTheme.sizes.triple),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      KXButton(
                        text: 'Selección\naleatoria',
                        disabled: exercisesStore.filters.amount <= 0,
                        onPressed: () {
                          exercisesStore.randomSelection();
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildTagFilterInfo(ExercisesStore exercisesStore) {
    if (exercisesStore.filters.tags.isEmpty) {
      return P4(
        text: 'Pulsa sobre una etiqueta\n para añadirlo al filtro',
        options: KXTextOptions(align: TextAlign.center),
      );
    }

    List<Widget> tags = [];

    for (String tag in exercisesStore.filters.tags) {
      tags.add(GestureDetector(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              P4(text: '#$tag'),
              KXIcon(
                Icons.delete_outline,
                size: IconSize.very_small,
              )
            ],
          ),
          onTap: () {
            exercisesStore.removeTagFilter(tag);
          }));
    }

    return Container(width: 100, child: Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: tags));
  }

  _buildAmountFilterInfo(ExercisesStore exercisesStore) {
    return Row(children: [
      KXIcon(
        Icons.remove,
        onTap: () => exercisesStore.decreaseExercisesAmount(),
      ),
      P3(
        text: exercisesStore.filters.amount.toString(),
        options: KXTextOptions(margin: EdgeInsets.symmetric(horizontal: KXTheme.sizes.dou)),
      ),
      KXIcon(
        Icons.add,
        onTap: () => exercisesStore.increaseExercisesAmount(),
      )
    ]);
  }
}
