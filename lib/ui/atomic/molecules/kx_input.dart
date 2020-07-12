import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p2.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p4.dart';

class KXInputValidators {
  static bool isNotEmpty(String value) => value != null && value.isNotEmpty;

  static bool length(String value, int length) => value.length == length;

  static Function isNumber({int min = 0, int max}) {
    return (String value) {
      if (value == null || value.isEmpty) return false;

      try {
        int valueParsed = int.parse(value);

        if (min != null && valueParsed < min) return false;
        if (max != null && valueParsed > max) return false;

        return true;
      } catch (ignored) {
        return false;
      }
    };
  }

  static bool isEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}

typedef void OnChange(String value);
typedef bool OnValidate(String value);

class KXInputOptions {
  String initialValue;
  String placeholder;

  String errorMessage;

  EdgeInsets padding;
  EdgeInsets margin;

  OnChange onChange;
  OnValidate onValidate;

  String mask;

  bool isReadonly;
  bool isPassword;
  TextAlign textAlign;
  int maxLines;
  int minLines;
  int maxLength;
  List<TextInputFormatter> inputFormatters;
  TextInputType keyboardType;
  TextStyle style;

  TextEditingController controller;
  FocusNode focusNode;

  KXInputOptions(
      {this.initialValue = "",
      this.errorMessage,
      this.padding,
      this.margin,
      this.onChange,
      this.onValidate,
      this.isReadonly = false,
      this.style,
      this.placeholder,
      this.textAlign,
      this.maxLines,
      this.minLines,
      this.isPassword = false,
      this.inputFormatters,
      this.keyboardType,
      this.maxLength,
      this.mask,
      this.controller,
      this.focusNode});
}

class KXInput extends StatefulWidget {
  final KXInputOptions options;

  KXInput({@required this.options});

  @override
  _KXInputState createState() => _KXInputState(this.options);
}

class _KXInputState extends State<KXInput> {
  final KXInputOptions options;

  _KXInputState(this.options) {
    if (options.controller != null) {
      this.options.controller = options.controller;
      if (this.options.initialValue.isNotEmpty) {
        this.options.controller.text = this.options.initialValue;
      }
    } else {
      this.options.controller = TextEditingController(text: this.options.initialValue ?? "");
    }

    this.options.focusNode = options.focusNode ?? FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    Widget textFormField = TextFormField(
        validator: (String value) {
          if (this.options.onValidate != null) {
            if (!this.options.onValidate(value)) {
              return this.options.errorMessage;
            }
          }
          return null;
        },
        textAlign: this.options.textAlign ?? TextAlign.start,
        maxLines: this.options.maxLines ?? 1,
        minLines: this.options.minLines,
        enableSuggestions: !this.options.isPassword,
        autocorrect: !this.options.isPassword,
        inputFormatters: this.options.inputFormatters ?? [],
        keyboardType: this.options.keyboardType,
        maxLength: this.options.maxLength,
        obscureText: this.options.isPassword,
        style: this.options.style ?? P2(text: '').options.style,
        decoration: InputDecoration(
            contentPadding: this.options.padding ?? EdgeInsets.symmetric(vertical: 0),
            isDense: true,
            errorStyle: P4(text: '').options.style,
            errorMaxLines: 3,
            hintText: this.options.placeholder),
        readOnly: this.options.isReadonly ?? false,
        controller: this.options.controller,
        focusNode: this.options.focusNode,
        onChanged: (value) {
          if (this.options.onChange != null) {
            this.options.onChange(value);
          }
        });
    if (this.options.isReadonly) {
      textFormField = IgnorePointer(child: textFormField);
    }
    return Container(
      margin: this.options.margin,
      child: textFormField,
    );
  }
}
