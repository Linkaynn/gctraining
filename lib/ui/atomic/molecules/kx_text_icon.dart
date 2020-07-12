import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';
import 'package:gctraining/ui/atomic/atoms/kx_icon.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';
import 'package:gctraining/ui/atomic/atoms/texts/p2.dart';

class KXTextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color iconColor;
  final EdgeInsets margin;
  final double marginBetween;
  final int maxLines;
  final bool isExpanded;
  final Function onTap;

  KXTextIcon(this.icon, this.text,
      {this.textColor,
      this.iconColor,
      this.margin,
      this.marginBetween,
      this.maxLines,
      this.onTap,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    KXText kxText = P2(
      text: this.text,
      options: KXTextOptions(style: TextStyle(color: this.textColor), maxLines: this.maxLines),
    );

    Widget text = this.isExpanded ? Expanded(child: kxText) : kxText;

    return Container(
      margin: this.margin,
      child: GestureDetector(
        onTap: this.onTap,
        child: Row(children: <Widget>[
          KXIcon(
            this.icon,
            color: this.iconColor,
            margin: EdgeInsets.only(right: this.marginBetween ?? KXTheme.sizes.unit),
          ),
          text
        ]),
      ),
    );
  }
}
