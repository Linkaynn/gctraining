import 'package:flutter/material.dart';
import 'package:gctraining/models/exercise.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p2.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p3.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p4.dart';
import 'package:gctraining/ui/atomic/atoms/texts/t4.dart';

typedef void OnTagTap(String tag);

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  final OnTagTap onTagTap;

  const ExerciseWidget({Key key, this.exercise, this.onTagTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(KXTheme.sizes.dou),
      decoration: BoxDecoration(
          border: Border.all(color: KXTheme.colors.secondary),
          color: KXTheme.colors.primary,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        T4(
          text: exercise.name,
          options:
              _getWhiteKXTextOptions().copyWith(KXTextOptions(margin: EdgeInsets.only(bottom: KXTheme.sizes.triple))),
        ),
        P2(
            text: 'Dificultad: ${exercise.difficultyName}',
            options: _getWhiteKXTextOptions()
                .copyWith(KXTextOptions(margin: EdgeInsets.only(bottom: KXTheme.sizes.triple)))),
        _buildSteps(),
        _buildTags()
      ]),
    );
  }

  _buildSteps() {
    if (exercise.explanation.isNotEmpty) {
      List<Widget> steps = [
        P2(
          text: 'Pasos',
          options: _getWhiteKXTextOptions().copyWith(KXTextOptions(margin: EdgeInsets.only(bottom: KXTheme.sizes.dou))),
        )
      ];

      for (String explanation in exercise.explanation) {
        steps.add(P3(text: '- $explanation', options: _getWhiteKXTextOptions()));
      }

      return Padding(
        padding: EdgeInsets.only(bottom: KXTheme.sizes.triple),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: steps),
      );
    }

    return Container();
  }

  KXTextOptions _getWhiteKXTextOptions() => KXTextOptions(style: TextStyle(color: KXTheme.colors.primaryComplementary));

  _buildTags() {
    List<Widget> tags = [];

    for (String tag in exercise.tags) {
      tags.add(GestureDetector(
          child: P4(
              text: '#$tag ',
              options: _getWhiteKXTextOptions().copyWith(
                  KXTextOptions(margin: EdgeInsets.only(top: KXTheme.sizes.unit, bottom: KXTheme.sizes.unit)))),
          onTap: () {
            this.onTagTap(tag);
          }));
    }

    return Wrap(children: tags);
  }
}
