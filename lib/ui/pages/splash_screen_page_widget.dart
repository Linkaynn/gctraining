import 'package:flutter/material.dart';
import 'package:gctraining/store/exercises_store.dart';
import 'package:gctraining/ui/atomic/atoms/texts/t1.dart';
import 'package:gctraining/utils/m_shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreenPageWidget extends StatefulWidget {
  @override
  _SplashScreenPageWidgetState createState() => _SplashScreenPageWidgetState();
}

class _SplashScreenPageWidgetState extends State<SplashScreenPageWidget> {
  @override
  void initState() {
    super.initState();
    this.init();
  }

  Future<void> init() async {
    await MSharedPreferences.initialize();
    ExercisesStore exercisesStore = Provider.of<ExercisesStore>(context, listen: false);

    String tags = MSharedPreferences.getString(MSharedPreferencesKeys.TAGS);

    if (tags != null && tags.isNotEmpty) {
      exercisesStore.filters.tags = tags.split(',');
    }

    exercisesStore.filter();

    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Center(child: T1(text: 'Cargando...'))),
    );
  }
}
