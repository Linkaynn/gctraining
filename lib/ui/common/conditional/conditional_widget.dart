import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  final Widget widget;
  final bool conditionToShow;

  ConditionalWidget({this.widget, this.conditionToShow});

  @override
  Widget build(BuildContext context) {
    return this.conditionToShow
        ? this.widget
        : Container(
            height: 0,
            width: 0,
          );
  }
}
