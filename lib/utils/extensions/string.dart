import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalizeFirst() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  bool toBoolean() {
    if (toLowerCase() == 'true' || toLowerCase() == '1') {
      return true;
    }
    if (toLowerCase() == 'false' || toLowerCase() == '0') {
      return false;
    }
    return false;
  }

  String capitalize() {
    return split(' ').map((word) => word.capitalizeFirst()).join(' ');
  }
}

String formatCurrency(double amount) {
  final currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: '',
  );
  return currencyFormat.format(amount);
}
