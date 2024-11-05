import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const _apiKey = '25c9fc22';
  static const _baseUrl = 'https://api.hgbrasil.com/finance';

  static Future<double> getConversionRate(String fromCurrency, String toCurrency, {http.Client? client}) async {
    client ??= http.Client();
    final url = Uri.parse('$_baseUrl?key=$_apiKey');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rate = data['results']['currencies'][toCurrency]['buy'] /
          data['results']['currencies'][fromCurrency]['buy'];
      return rate;
    } else {
      throw Exception('Falha ao obter dados da API');
    }
  }
}