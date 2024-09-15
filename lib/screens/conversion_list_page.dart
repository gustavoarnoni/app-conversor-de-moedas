import 'package:flutter/material.dart';
import '../models/conversion.dart';

class ConversionListPage extends StatelessWidget {
  final List<Conversion> conversions;

  ConversionListPage({required this.conversions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Conversões')),
      body: ListView.builder(
        itemCount: conversions.length,
        itemBuilder: (context, index) {
          final conversion = conversions[index];
          return ListTile(
            title: Text('${conversion.amount} ${conversion.fromCurrency.code} para ${conversion.convertedAmount} ${conversion.toCurrency.code}'),
            subtitle: Text('De ${conversion.fromCurrency.name} para ${conversion.toCurrency.name}'),
          );
        },
      ),
    );
  }
}