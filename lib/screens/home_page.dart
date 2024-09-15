import 'package:flutter/material.dart';
import '../models/currency.dart';
import '../models/conversion.dart';
import '../widgets/currency_dropdown.dart';
import '../utils/api_service.dart';
import 'conversion_list_page.dart';
import 'conversion_form_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _amount = 0;
  double _convertedAmount = 0;

  final List<Conversion> _conversions = [];

  Future<void> _convert() async {
    try {
      final rate = await ApiService.getConversionRate(_fromCurrency, _toCurrency);
      final convertedAmount = _amount * rate;

      setState(() {
        _convertedAmount = convertedAmount;
        _conversions.add(
          Conversion(
            fromCurrency: Currency(code: _fromCurrency, name: _fromCurrency),
            toCurrency: Currency(code: _toCurrency, name: _toCurrency),
            amount: _amount,
            convertedAmount: convertedAmount,
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao converter: $e')),
      );
    }
  }

  void _addConversion(Conversion conversion) {
    setState(() {
      _conversions.add(conversion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversionListPage(conversions: _conversions),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CurrencyDropdown(
              value: _fromCurrency,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _fromCurrency = value;
                  });
                }
              },
              currencies: ['USD', 'EUR', 'BRL', 'JPY'],
            ),
            CurrencyDropdown(
              value: _toCurrency,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _toCurrency = value;
                  });
                }
              },
              currencies: ['USD', 'EUR', 'BRL', 'JPY'],
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _amount = double.tryParse(value) ?? 0;
              },
            ),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Converter'),
            ),
            Text('Valor convertido: $_convertedAmount'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConversionFormPage(onConversionAdded: _addConversion),
                  ),
                );
              },
              child: Text('Adicionar Conversão'),
            ),
          ],
        ),
      ),
    );
  }
}