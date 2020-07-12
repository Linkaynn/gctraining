import 'dart:ui';

import 'package:flutter/material.dart';

// Colors

const PRIMARY_COLOR = Color.fromRGBO(44, 62, 80, 1);
const PRIMARY_COMPLEMENTARY_COLOR = Color.fromRGBO(255, 255, 255, 1);
const SECONDARY_COLOR = Color.fromRGBO(123, 157, 164, 1);
const TERTIARY_COLOR = Color(0xff91CCD2);
const DISABLED_COLOR = Color(0xffCCCCCC);
const DANGER_COLOR = Color(0xffA9494E);

class KXColors {
  Color primary = PRIMARY_COLOR;
  Color primaryComplementary = PRIMARY_COMPLEMENTARY_COLOR;
  Color secondary = SECONDARY_COLOR;
  Color tertiary = TERTIARY_COLOR;
  Color disabled = DISABLED_COLOR;
  Color danger = DANGER_COLOR;

  MaterialColor primaryMaterial = MaterialColor(PRIMARY_COLOR.value, <int, Color>{
    50: Color.fromRGBO(44, 62, 80, 0.1),
    100: Color.fromRGBO(44, 62, 80, 0.2),
    200: Color.fromRGBO(44, 62, 80, 0.3),
    300: Color.fromRGBO(44, 62, 80, 0.4),
    400: Color.fromRGBO(44, 62, 80, 0.5),
    500: Color.fromRGBO(44, 62, 80, 0.6),
    600: Color.fromRGBO(44, 62, 80, 0.7),
    700: Color.fromRGBO(44, 62, 80, 0.8),
    800: Color.fromRGBO(44, 62, 80, 0.9),
    900: Color(PRIMARY_COLOR.value),
  });

  MaterialColor secondaryMaterial = MaterialColor(SECONDARY_COLOR.value, <int, Color>{
    50: Color.fromRGBO(123, 157, 164, 0.1),
    100: Color.fromRGBO(123, 157, 164, 0.2),
    200: Color.fromRGBO(123, 157, 164, 0.3),
    300: Color.fromRGBO(123, 157, 164, 0.4),
    400: Color.fromRGBO(123, 157, 164, 0.5),
    500: Color.fromRGBO(123, 157, 164, 0.6),
    600: Color.fromRGBO(123, 157, 164, 0.7),
    700: Color.fromRGBO(123, 157, 164, 0.8),
    800: Color.fromRGBO(123, 157, 164, 0.9),
    900: Color(SECONDARY_COLOR.value),
  });
}
