import 'dart:convert';
import 'package:http/http.dart' as http;

class ExchangeRateService {
  static const String _baseUrl = 'https://api.exchangerate-api.com/v4/latest';

  static Future<double> fetchExchangeRate(String from, String to) async {
    final url = '$_baseUrl/$from';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['rates'][to];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
