import 'package:flutter/material.dart';
import '../models/currency.dart';
import '../models/conversion.dart';
import '../utils/api_service.dart';

class ConversionFormPage extends StatefulWidget {
  final Function(Conversion) onConversionAdded;

  ConversionFormPage({required this.onConversionAdded});

  @override
  _ConversionFormPageState createState() => _ConversionFormPageState();
}

class _ConversionFormPageState extends State<ConversionFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Conversão')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _fromCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    _fromCurrency = newValue!;
                  });
                },
                items: ['USD', 'EUR', 'BRL', 'JPY'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Moeda de Origem'),
              ),
              DropdownButtonFormField<String>(
                value: _toCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    _toCurrency = newValue!;
                  });
                },
                items: ['USD', 'EUR', 'BRL', 'JPY'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Moeda de Destino'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _amount = double.tryParse(value) ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um valor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final rate = await ApiService.getConversionRate(_fromCurrency, _toCurrency);
                      final convertedAmount = _amount * rate;

                      final conversion = Conversion(
                        fromCurrency: Currency(code: _fromCurrency, name: _fromCurrency),
                        toCurrency: Currency(code: _toCurrency, name: _toCurrency),
                        amount: _amount,
                        convertedAmount: convertedAmount,
                      );

                      widget.onConversionAdded(conversion);

                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Erro ao obter a taxa de conversão: $e')),
                      );
                    }
                  }
                },
                child: Text('Adicionar Conversão'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}