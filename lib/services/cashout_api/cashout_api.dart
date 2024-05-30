import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../src/app_shared.dart';

class CashoutApi {
  String baseUrl = "https://komiwall.com/app/public/cashout";
  fetchCashoutMethods() async {
    try {
      var request = await http.get(Uri.parse(
        "$baseUrl/cashout_methods.php",
      ));

      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);

        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  cashoutRequest({amount, pointsUsed, userInfo, method, methodImage}) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/cashout_request.php",
          ),
          body: {
            "amount": amount,
            "method": method,
            "user_info": userInfo,
            "points_used": pointsUsed,
            "username": SharedPref.localStorage!.getString('username')!,
            "method_image": methodImage
          });

      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        print(response);
        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
