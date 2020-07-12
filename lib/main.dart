import 'package:flutter/material.dart';
import 'package:gctraining/store/exercises_store.dart';
import 'package:gctraining/ui/pages/all_exercises_page_widget.dart';
import 'package:gctraining/ui/pages/exercises_page_widget.dart';
import 'package:gctraining/ui/pages/splash_screen_page_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GCTraining());
}

class GCTraining extends StatefulWidget {
  @override
  _GCTrainingState createState() => _GCTrainingState();
}

class _GCTrainingState extends State<GCTraining> {
  final ExercisesStore _exercisesStore = ExercisesStore();

  @override
  void initState() {
    super.initState();
    this.init();
  }

  Future<void> init() async {
    await _exercisesStore.init();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ExercisesStore>(
        create: (_) => _exercisesStore,
        builder: (BuildContext context, _) {
          return MaterialApp(
            title: 'GCTraining',
            debugShowCheckedModeBanner: false,
            initialRoute: 'loading',
            routes: {
              'home': (_) => AllExercisesPageWidget(),
              'exercises': (_) => ExercisesPageWidget(),
              'loading': (_) => SplashScreenPageWidget()
            },
          );
        });
  }
}
