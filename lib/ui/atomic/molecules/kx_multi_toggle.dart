import 'package:flutter/material.dart';
import 'package:gctraining/ui/atomic/molecules/kx_button.dart';

typedef void OnSelected();

class KXMultiToggleOption {
  final String name;

  final bool isSelected;
  final OnSelected onSelected;

  final bool invertColors;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  KXMultiToggleOption(
      {this.name,
      this.isSelected,
      this.onSelected,
      this.invertColors = false,
      this.mainAxisAlignment,
      this.crossAxisAlignment});
}

class KXMultiToggle extends StatelessWidget {
  final List<KXMultiToggleOption> options;

  final EdgeInsets margin;

  KXMultiToggle({this.options, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.margin,
      child: Row(
        children: this.options.map((option) {
          return Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: option.mainAxisAlignment ?? MainAxisAlignment.center,
                  crossAxisAlignment: option.crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: <Widget>[
                    KXButton(
                      invertColors: !option.isSelected,
                      text: option.name,
                      onPressed: option.onSelected,
                    ),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
