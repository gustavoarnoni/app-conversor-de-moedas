import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:conversor/utils/api_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('API Service Tests', () {
    test('should return conversion rate when the API call is successful', () async {
      final client = MockClient();
      final apiService = ApiService();

      when(client.get(Uri.parse('https://api.hgbrasil.com/finance?key=25c9fc22')))
          .thenAnswer((_) async => http.Response('{"results":{"currencies":{"USD":{"buy":5.0},"BRL":{"buy":1.0}}}}', 200));

      final rate = await ApiService.getConversionRate('BRL', 'USD');

      expect(rate, 5.0);
    });

    test('should throw an exception when the API call is unsuccessful', () async {
      final client = MockClient();
      final apiService = ApiService();

      when(client.get(Uri.parse('https://api.hgbrasil.com/finance?key=25c9fc22')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() async => await ApiService.getConversionRate('BRL', 'USD'), throwsException);
    });

    test('should throw an exception when the API response is invalid', () async {
      final client = MockClient();
      final apiService = ApiService();

      when(client.get(Uri.parse('https://api.hgbrasil.com/finance?key=25c9fc22')))
          .thenAnswer((_) async => http.Response('{"invalid":"response"}', 200));

      expect(() async => await ApiService.getConversionRate('BRL', 'USD'), throwsException);
    });
  });
}