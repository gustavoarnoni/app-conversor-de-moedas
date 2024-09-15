import 'currency.dart';

class Conversion {
  final Currency fromCurrency;
  final Currency toCurrency;
  final double amount;
  final double convertedAmount;

  Conversion({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
    required this.convertedAmount,
  });
}