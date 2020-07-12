import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p1.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p2.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p3.dart';

enum KXButtonTextSize { P1, P2, P3 }

class KXButton extends StatelessWidget {
  final String text;
  final KXButtonTextSize textSize;
  final Function onPressed;

  final bool isLoading;
  final bool disabled;
  final bool invertColors;
  final bool flatted;

  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;

  final Color backgroundColor;

  final int maxLines;

  final double minWidth;

  final bool disableAutoSizeText;

  KXButton(
      {this.text,
      this.textSize = KXButtonTextSize.P2,
      this.onPressed,
      this.isLoading = false,
      this.disabled = false,
      this.invertColors = false,
      this.flatted = false,
      this.height,
      this.width,
      this.padding = const EdgeInsets.all(8),
      this.margin = const EdgeInsets.all(0),
      this.maxLines,
      this.minWidth = 88,
      this.backgroundColor,
      this.disableAutoSizeText = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: !this.isLoading && !this.disabled ? this.onPressed : () {},
      child: Container(
          constraints: BoxConstraints(minWidth: this.minWidth),
          margin: this.margin,
          height: this.isLoading ? null : height,
          width: this.isLoading ? null : width,
          decoration: BoxDecoration(
              border: _getBorderStyle(),
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Center(
            child: Padding(
              padding: this.isLoading ? EdgeInsets.all(KXTheme.sizes.dou) : this.padding,
              child: this.isLoading
                  ? CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: KXTheme.colors.primary,
                    )
                  : _buildButtonText(),
            ),
          )),
    );
  }

  KXText _buildButtonText() {
    KXTextOptions textOptions = KXTextOptions(
      maxLines: this.maxLines,
      align: TextAlign.center,
      disableAutoSizeText: this.disableAutoSizeText,
      style: TextStyle(color: _getTextColor()),
    );

    switch (this.textSize) {
      case KXButtonTextSize.P1:
        return P1(
          text: this.text,
          options: textOptions,
        );
      case KXButtonTextSize.P3:
        return P3(
          text: this.text,
          options: textOptions,
        );
      default:
        return P2(
          text: this.text,
          options: textOptions,
        );
    }
  }

  Color _getTextColor() {
    if ((this.invertColors || this.flatted) && !this.disabled) {
      return KXTheme.colors.primary;
    }

    return Colors.white;
  }

  Border _getBorderStyle() {
    if (this.invertColors && !this.disabled) {
      return Border.all(color: KXTheme.colors.primary);
    }

    return null;
  }

  Color _getBackgroundColor() {
    if (this.disabled) {
      return KXTheme.colors.disabled;
    }

    if (backgroundColor != null) {
      return backgroundColor;
    }

    if (!this.invertColors && !this.flatted) {
      return KXTheme.colors.primary;
    }

    return null;
  }
}
