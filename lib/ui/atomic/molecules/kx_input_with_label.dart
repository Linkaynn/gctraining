import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p1.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p2.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p3.dart';
import 'package:gctraining/ui/atomic/molecules/kx_input.dart';

enum KXInputLabelSize { small, medium, big }

class KXInputWithLabel extends StatelessWidget {
  final String textLabel;
  final KXInputLabelSize labelSize;

  final KXInputOptions inputOptions;

  final EdgeInsets margin;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  KXInputWithLabel(
      {@required this.textLabel,
      @required this.inputOptions,
      this.labelSize = KXInputLabelSize.big,
      this.margin,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    this.inputOptions.margin = EdgeInsets.only(bottom: KXTheme.sizes.quad);
    return Container(
      margin: this.margin,
      child: Column(
        crossAxisAlignment: this.crossAxisAlignment,
        mainAxisAlignment: this.mainAxisAlignment,
        children: <Widget>[_buildLabel(), KXInput(options: inputOptions)],
      ),
    );
  }

  KXText _buildLabel() {
    String textLabel = this.textLabel;
    KXTextOptions options = KXTextOptions(
      margin: EdgeInsets.only(bottom: KXTheme.sizes.unit),
    );

    switch (this.labelSize) {
      case KXInputLabelSize.big:
        return P1(
          text: textLabel,
          options: options,
        );
      case KXInputLabelSize.medium:
        return P2(
          text: textLabel,
          options: options,
        );
      default:
        return P3(
          text: textLabel,
          options: options,
        );
    }
  }
}
