import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';

class T3 extends KXText {
  T3({String text, KXTextOptions options = const KXTextOptions()})
      : super(
            text: text,
            options: KXTextOptions(
                style: TextStyle(fontSize: KXTheme.font.sizes.title3, fontWeight: KXTheme.font.weights.title3)
                    .merge(options.style),
                align: options.align,
                margin: options.margin,
                maxLines: options.maxLines,
                minFontSize: options.minFontSize,
                disableAutoSizeText: options.disableAutoSizeText));
}
