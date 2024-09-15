import 'package:flutter/material.dart';

class ConversionItem extends StatelessWidget {
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  final double convertedAmount;

  ConversionItem({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
    required this.convertedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$amount $fromCurrency para $toCurrency'),
      subtitle: Text('Convertido: $convertedAmount $toCurrency'),
    );
  }
}