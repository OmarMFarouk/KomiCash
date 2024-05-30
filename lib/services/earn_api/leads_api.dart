import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class LeadsApi {
  String baseUrl = "https://komiwall.com/app/public/leads";
  Future fetchLeads() async {
    try {
      var request = await http.post(
        Uri.parse(
          "$baseUrl/leads.php",
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
