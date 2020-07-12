import 'package:flutter/material.dart';
import 'package:gctraining/styles/theme/kx_colors.dart';
import 'package:gctraining/styles/theme/kx_font.dart';
import 'package:gctraining/styles/theme/kx_sizes.dart';

class KXTheme {
  static KXFont font = KXFont();
  static KXColors colors = KXColors();
  static KXSizes sizes = KXSizes();
}

class KXThemeData {
  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: KXTheme.font.fontFamily,
        primaryColor: KXTheme.colors.primary,
        accentColor: KXTheme.colors.secondary,
        secondaryHeaderColor: KXTheme.colors.secondaryMaterial,
        errorColor: Colors.red);
  }
}
