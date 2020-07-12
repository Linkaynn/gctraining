import 'package:flutter/material.dart';
import 'package:gctraining/store/exercises_store.dart';
import 'package:gctraining/ui/pages/all_exercises_page_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GCTraining());
}

class GCTraining extends StatelessWidget {
  final ExercisesStore _exercisesStore = ExercisesStore();

  GCTraining() {
    WidgetsFlutterBinding.ensureInitialized();
    _exercisesStore.init();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ExercisesStore>(
        create: (_) => _exercisesStore,
        builder: (BuildContext context, _) {
          return MaterialApp(
            title: 'GCTraining',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {'/': (_) => AllExercisesPageWidget()},
          );
        });
  }
}
