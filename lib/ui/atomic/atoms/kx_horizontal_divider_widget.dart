import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';

class KXHorizontalDividerWidget extends StatelessWidget {
  final double verticalPadding;
  final double horizontalPadding;

  final double thickness;

  final Color color;

  KXHorizontalDividerWidget({this.verticalPadding = 0, this.horizontalPadding, this.thickness = 1, this.color});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = EdgeInsets.symmetric(vertical: this.verticalPadding);

    if (this.horizontalPadding != null) {
      padding = padding.copyWith(left: this.horizontalPadding, right: this.horizontalPadding);
    }

    return Padding(
      padding: padding,
      child: Container(
        height: this.thickness,
        decoration: BoxDecoration(color: this.color ?? KXTheme.colors.primary),
      ),
    );
  }
}
