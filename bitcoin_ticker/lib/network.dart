import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:convert';

class Network {
  Future fetchExchangeRate(String first, String second) async {
    final response = await http.get(
        Uri.parse('https://rest.coinapi.io/v1/exchangerate/$first/$second'),
        headers: {'Accept': 'text/plain', 'X-CoinAPI-Key': kAPIKey});

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    return responseJson['rate'];
  }
}
