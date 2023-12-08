extension DoubleExtension on double {
  double toLineHeight({required double fontSize}) {
    if (fontSize != 0) {
      return double.tryParse((this / fontSize).toStringAsFixed(2)) ?? 0.0;
    }
    return 1.0;
  }
}
