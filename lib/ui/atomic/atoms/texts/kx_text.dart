import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';

class KXTextOptions {
  final TextStyle style;
  final TextAlign align;
  final EdgeInsets margin;
  final int maxLines;
  final double minFontSize;
  final bool disableAutoSizeText;

  const KXTextOptions(
      {this.style = const TextStyle(),
      this.align,
      this.margin,
      this.maxLines,
      this.minFontSize,
      this.disableAutoSizeText});

  copyWith(KXTextOptions options) {
    return new KXTextOptions(
        style: this.style.merge(options.style),
        margin: this.margin ?? options.margin,
        align: this.align ?? options.align,
        disableAutoSizeText: this.disableAutoSizeText ?? options.disableAutoSizeText,
        maxLines: this.maxLines ?? options.maxLines,
        minFontSize: this.minFontSize ?? options.minFontSize);
  }
}

class KXText extends StatelessWidget {
  final String text;

  final KXTextOptions options;

  KXText({@required this.text, this.options});

  @override
  Widget build(BuildContext context) {
    Widget textWidget = this.options.disableAutoSizeText != null && this.options.disableAutoSizeText
        ? Text(
            this.text,
            maxLines: this.options.maxLines,
            style: this.options.style.copyWith(fontFamily: KXTheme.font.fontFamily),
            textAlign: this.options.align ?? TextAlign.left,
          )
        : AutoSizeText(
            this.text,
            maxLines: this.options.maxLines,
            minFontSize: this.options.minFontSize ?? 10.0,
            style: this.options.style.copyWith(fontFamily: KXTheme.font.fontFamily),
            textAlign: this.options.align ?? TextAlign.left,
          );

    if (this.options.margin != null) {
      return Padding(
        padding: this.options.margin,
        child: textWidget,
      );
    }
    return textWidget;
  }
}
