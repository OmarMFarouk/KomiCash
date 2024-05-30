import 'dart:convert';

import 'package:http/http.dart' as http;

class OfferApi {
  String baseUrl = "https://komiwall.com/app/public/networks";
  Future fetchYoumi() async {
    var request = await http.get(Uri.parse('$baseUrl/youmi_api.php'));
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);

      return response;
    }
    print('error');
  }

  Future fetchOGads() async {
    var request = await http.get(Uri.parse('$baseUrl/ogads_api.php'));
    if (request.statusCode == 200) {
      var response = jsonDecode(request.body);

      return response;
    }
    print('error');
  }
}
