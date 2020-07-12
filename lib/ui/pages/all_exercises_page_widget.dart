import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gctraining/models/exercise.dart';
import 'package:gctraining/store/exercises_store.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/kx_icon.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p3.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p4.dart';
import 'package:gctraining/ui/atomic/atoms/texts/t3.dart';
import 'package:gctraining/ui/widgets/exercise_widget.dart';
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
    ExercisesStore exercisesStore = Provider.of<ExercisesStore>(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(APPBAR_HEIGHT),
          child: AppBar(
            title: const Text('Todos los ejercicios'),
          ),
        ),
        body: Observer(builder: (_) {
          if (exercisesStore.isLoading) {
            return Center(child: Text('Cargando...'));
          }

          return Column(
            children: [
              Container(
                height: FILTER_HEIGHT,
                child: Padding(
                  padding: EdgeInsets.only(left: KXTheme.sizes.units(7)),
                  child: Row(
                    children: [
                      T3(
                        text: 'Filtros',
                        options: KXTextOptions(margin: EdgeInsets.only(right: KXTheme.sizes.triple)),
                      ),
                      Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              P3(
                                text: 'Etiquetas',
                                options: KXTextOptions(margin: EdgeInsets.only(bottom: KXTheme.sizes.dou)),
                              ),
                              _buildTagFilterInfo(exercisesStore)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    FILTER_HEIGHT -
                    APPBAR_HEIGHT -
                    MediaQuery.of(context).padding.top,
                child: RefreshIndicator(
                  onRefresh: () => exercisesStore.init(),
                  child: ListView.builder(
                      itemCount: exercisesStore.exercisesFiltered.length,
                      padding: EdgeInsets.all(KXTheme.sizes.quad),
                      itemBuilder: (BuildContext context, int index) {
                        Exercise exercise = exercisesStore.exercisesFiltered[index];

                        return Padding(
                          padding: EdgeInsets.all(KXTheme.sizes.dou),
                          child: ExerciseWidget(
                            exercise: exercise,
                            onTagTap: (String tag) => exercisesStore.addTagFilter(tag),
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
        }),
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

    return Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: tags);
  }
}
