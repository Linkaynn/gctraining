import 'package:flutter/material.dart';
import 'package:gctraining/ui/atomic/molecules/kx_input.dart';
import 'package:gctraining/utils/date_util.dart';

typedef bool OnValidate(String value);
typedef void OnDatePicked(DateTime date, TimeOfDay time);

class KXDatePickerInputOptions {
  DateTime currentDate;

  OnDatePicked onDatePicked;

  bool hasTimePicker;

  DateTime firstDate;
  DateTime lastDate;

  EdgeInsets inputMargin;

  OnValidate onValidate;
  String errorMessage;

  String placeholder;

  TextAlign textAlign;

  TextEditingController controller;

  KXDatePickerInputOptions(
      {this.currentDate,
      this.onValidate,
      this.controller,
      this.errorMessage,
      this.placeholder,
      this.textAlign = TextAlign.left,
      this.onDatePicked,
      this.hasTimePicker = false,
      this.firstDate,
      this.lastDate,
      this.inputMargin});
}

class KXDatePickerInput extends StatefulWidget {
  final KXDatePickerInputOptions options;

  KXDatePickerInput({@required this.options});

  @override
  _KXDatePickerInputState createState() => _KXDatePickerInputState(this.options);
}

class _KXDatePickerInputState extends State<KXDatePickerInput> {
  KXDatePickerInputOptions options;

  DateTime _currentDate;

  TextEditingController controller = TextEditingController();

  _KXDatePickerInputState(this.options) {
    this._currentDate = this.options.currentDate;

    if (options.controller != null) {
      this.controller = options.controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final DateTime picked = await showDatePicker(
            context: context,
            initialDate: this.options.currentDate ?? DateTime.now(),
            firstDate: this.options.firstDate ?? DateTime(DateTime.now().year - 2),
            lastDate: this.options.lastDate ?? DateTime(DateTime.now().year + 2));

        if (picked == null) return;

        TimeOfDay time;

        if (this.options.hasTimePicker) {
          time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: this.options.currentDate.hour, minute: this.options.currentDate.minute));
        }

        if (picked != null) {
          this.options.onDatePicked(picked, time);
          setState(() {
            this._currentDate = this.options.hasTimePicker
                ? DateTime(picked.year, picked.month, picked.day, time.hour, time.minute)
                : DateTime(picked.year, picked.month, picked.day);
            this.controller.text = _getCurrentDateAsString();
          });
        }
      },
      child: IgnorePointer(
        child: KXInput(
          options: KXInputOptions(
            onValidate: this.options.onValidate,
            errorMessage: this.options.errorMessage,
            placeholder: this.options.placeholder,
            margin: this.options.inputMargin ?? EdgeInsets.all(0),
            initialValue: this._currentDate != null ? _getCurrentDateAsString() : '',
            controller: this.controller,
            isReadonly: true,
            textAlign: this.options.textAlign,
          ),
        ),
      ),
    );
  }

  String _getCurrentDateAsString() {
    return this.options.hasTimePicker
        ? DateUtil.dayMonthYearHourMinutes(this._currentDate)
        : DateUtil.dayMonthYear(this._currentDate);
  }
}
