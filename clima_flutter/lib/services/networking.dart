import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getLocationData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

      // double temperature = decodedData['main']['temp'];
      // int condition = decodedData['weather'][0]['id'];
      // String cityName = decodedData['name'];