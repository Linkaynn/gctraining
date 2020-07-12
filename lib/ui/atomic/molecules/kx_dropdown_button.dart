import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gctraining/ui/atomic/atoms/kx_icon.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p2.dart';

class KXDropdownButton extends StatefulWidget {
  final String initialValue;
  final List<String> items;
  final EdgeInsets margin;
  final Function onChanged;

  KXDropdownButton({this.initialValue, this.items, this.margin, this.onChanged});

  @override
  _KXDropdownButtonState createState() =>
      _KXDropdownButtonState(this.initialValue, this.items, this.margin, this.onChanged);
}

class _KXDropdownButtonState extends State<KXDropdownButton> {
  String dropdownValue;
  List<String> items;
  EdgeInsets margin;
  Function onChanged;

  _KXDropdownButtonState(this.dropdownValue, this.items, this.margin, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: DropdownButton<String>(
        isExpanded: true,
        value: this.dropdownValue,
        icon: KXIcon(Icons.filter_list, size: IconSize.medium),
        underline: Container(),
        onChanged: (String newValue) {
          setState(() {
            this.dropdownValue = newValue;
          });
          this.onChanged(newValue);
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: P2(text: value),
          );
        }).toList(),
      ),
    );
  }
}
