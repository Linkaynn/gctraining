import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';

class T4 extends KXText {
  T4({String text, KXTextOptions options = const KXTextOptions()})
      : super(
            text: text,
            options: KXTextOptions(
                style: TextStyle(fontSize: KXTheme.font.sizes.title4, fontWeight: KXTheme.font.weights.title4)
                    .merge(options.style),
                align: options.align,
                margin: options.margin,
                maxLines: options.maxLines,
                minFontSize: options.minFontSize,
                disableAutoSizeText: options.disableAutoSizeText));
}
