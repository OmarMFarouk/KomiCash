import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworksApi {
  String baseUrl = "https://komiwall.com/app/public/networks";

  Future fetchNetworks() async {
    try {
      var request = await http.post(
        Uri.parse(
          "$baseUrl/networks.php",
        ),
      );

      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);

        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
