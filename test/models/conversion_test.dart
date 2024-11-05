import 'package:test/test.dart';
import 'package:conversor/models/conversion.dart';
import 'package:conversor/models/currency.dart';

void main() {
  test('should create a valid Conversion object', () {
    final fromCurrency = Currency(code: 'USD', name: 'United States Dollar');
    final toCurrency = Currency(code: 'EUR', name: 'Euro');
    final conversion = Conversion(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: 100,
      convertedAmount: 85,
    );

    expect(conversion.fromCurrency.code, 'USD');
    expect(conversion.toCurrency.code, 'EUR');
    expect(conversion.amount, 100);
    expect(conversion.convertedAmount, 85);
  });

  test('should handle zero amount correctly', () {
    final fromCurrency = Currency(code: 'USD', name: 'United States Dollar');
    final toCurrency = Currency(code: 'EUR', name: 'Euro');
    final conversion = Conversion(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: 0,
      convertedAmount: 0,
    );

    expect(conversion.amount, 0);
    expect(conversion.convertedAmount, 0);
  });

  test('should handle negative amount correctly', () {
    final fromCurrency = Currency(code: 'USD', name: 'United States Dollar');
    final toCurrency = Currency(code: 'EUR', name: 'Euro');
    final conversion = Conversion(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: -50,
      convertedAmount: 0,
    );

    expect(conversion.amount, -50);
    expect(conversion.convertedAmount, 0);
  });

  test('should handle large amount correctly', () {
    final fromCurrency = Currency(code: 'USD', name: 'United States Dollar');
    final toCurrency = Currency(code: 'EUR', name: 'Euro');
    final conversion = Conversion(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: 1000000,
      convertedAmount: 850000,
    );

    expect(conversion.amount, 1000000);
    expect(conversion.convertedAmount, 850000);
  });
}