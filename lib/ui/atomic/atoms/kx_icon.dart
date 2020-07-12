import 'package:flutter/material.dart';
import 'package:gctraining/styles/app.theme.dart';

enum IconSize { very_small, small, medium, big }

class KXIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final IconSize size;
  final EdgeInsets margin;
  final Function onTap;

  KXIcon(this.icon, {this.color, this.size, this.margin, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      this.icon,
      color: this.color ?? KXTheme.colors.primary,
      size: _getIconSize(),
    );

    if (this.margin == null) {
      return GestureDetector(
        onTap: this.onTap,
        child: icon,
      );
    }

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: this.margin,
        child: icon,
      ),
    );
  }

  double _getIconSize() {
    switch (this.size) {
      case IconSize.big:
        return KXTheme.sizes.units(6);
        break;
      case IconSize.medium:
        return KXTheme.sizes.quint;
        break;
      case IconSize.very_small:
        return KXTheme.sizes.triple;
        break;
      default:
        return KXTheme.sizes.quad;
    }
  }
}
