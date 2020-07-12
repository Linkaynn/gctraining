import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';

class KXVerticalDividerWidget extends StatelessWidget {
  final double verticalPadding;
  final double horizontalPadding;

  final double height;
  final double thickness;

  final Color color;

  KXVerticalDividerWidget(
      {this.verticalPadding, this.horizontalPadding = 0, this.thickness = 1, this.color, @required this.height});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = EdgeInsets.symmetric(horizontal: this.horizontalPadding);

    if (this.verticalPadding != null) {
      padding = padding.copyWith(left: this.verticalPadding, right: this.verticalPadding);
    }

    return Padding(
      padding: padding,
      child: Container(
        height: this.height,
        width: this.thickness,
        decoration: BoxDecoration(color: this.color ?? KXTheme.colors.primary),
      ),
    );
  }
}
