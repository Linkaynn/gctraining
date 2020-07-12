import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p1.dart';
import 'package:gctraining/ui/atomic/molecules/kx_date_picker_input.dart';

class KXDatePickerInputWithLabel extends StatelessWidget {
  final String textLabel;

  final KXDatePickerInputOptions datePickerOptions;

  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  KXDatePickerInputWithLabel(
      {@required this.textLabel,
      @required this.datePickerOptions,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    this.datePickerOptions.inputMargin = EdgeInsets.only(bottom: KXTheme.sizes.quad);
    return Column(
      crossAxisAlignment: this.crossAxisAlignment,
      mainAxisAlignment: this.mainAxisAlignment,
      children: <Widget>[
        P1(
          text: textLabel,
          options: KXTextOptions(
            margin: EdgeInsets.only(bottom: KXTheme.sizes.unit),
          ),
        ),
        KXDatePickerInput(options: datePickerOptions)
      ],
    );
  }
}
