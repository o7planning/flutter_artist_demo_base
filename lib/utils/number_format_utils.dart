import 'package:intl/intl.dart';

final NumberFormat _currencyFormat = NumberFormat.currency(
  symbol: '\$',
  decimalDigits: 0,
);

final NumberFormat _numberFormat = NumberFormat.decimalPattern();

String formatCurrency(double value) {
  return _currencyFormat.format(value);
}

String formatNumber(double value) {
  return _numberFormat.format(value);
}
