

class KXSizes {
  final double unit = 4.0;

  get dou => unit * 2;

  get triple => unit * 3;

  get quad => unit * 4;

  get quint => unit * 5;

  get sixth => unit * 6;

  double units(double multiplier) {
    return unit * multiplier;
  }
}
