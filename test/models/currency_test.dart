class Currency {
  final double amount;
  final String code;
  final String name;

  Currency({required this.amount, required this.code, required this.name});

  Currency convertTo(String targetCode) {
    final conversionRates = {
      'USD': {'EUR': 0.85, 'JPY': 110.0},
      'EUR': {'USD': 1.18, 'JPY': 130.0},
    };

    final rate = conversionRates[code]?[targetCode] ?? 1.0;
    return Currency(amount: amount * rate, code: targetCode, name: name);
  }
}