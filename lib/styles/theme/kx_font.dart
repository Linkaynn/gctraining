import 'package:flutter/material.dart';

class KXFont {
  String fontFamily = 'SourceSansPro';

  KXFontSizes sizes = KXFontSizes();

  KXFontWeights weights = KXFontWeights();
}

class KXFontSizes {
  double title1 = 24;
  double title2 = 22;
  double title3 = 20;
  double title4 = 18;
  double title5 = 16;
  double title6 = 14;

  double paragraph1 = 16;
  double paragraph2 = 14;
  double paragraph3 = 12;
  double paragraph4 = 10;
}

class KXFontWeights {
  FontWeight title1 = FontWeight.w800;
  FontWeight title2 = FontWeight.w600;
  FontWeight title3 = FontWeight.w600;
  FontWeight title4 = FontWeight.w500;
  FontWeight title5 = FontWeight.w600;
  FontWeight title6 = FontWeight.w600;

  FontWeight paragraph1 = FontWeight.w500;
  FontWeight paragraph2 = FontWeight.w500;
  FontWeight paragraph3 = FontWeight.w500;
  FontWeight paragraph4 = FontWeight.w300;
}
