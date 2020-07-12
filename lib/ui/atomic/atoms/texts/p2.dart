import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';

class P2 extends KXText {
  P2({String text, KXTextOptions options = const KXTextOptions()})
      : super(
            text: text,
            options: KXTextOptions(
                style: TextStyle(fontSize: KXTheme.font.sizes.paragraph2, fontWeight: KXTheme.font.weights.paragraph2)
                    .merge(options.style),
                align: options.align,
                margin: options.margin,
                maxLines: options.maxLines,
                minFontSize: options.minFontSize,
                disableAutoSizeText: options.disableAutoSizeText));
}
