import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:komiwall/src/app_shared.dart';
import 'package:my_device_info_plus/my_device_info_plus.dart';

class AuthApi {
  String baseUrl = "https://komiwall.com/app/public/auth";

  Future<dynamic> getDeviceInfo() async {
    var result = await MyDeviceInfoPlus.getDeviceInfo();

    return '${result['model']} / Android ${result['os_version']}';
  }

  registerUser({username, email, password}) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/register_user.php",
          ),
          body: {
            'username': username,
            'email': email,
            'password': password,
            'device_info': await getDeviceInfo(),
            'fcm_token':
                SharedPref.localStorage!.getString('token') ?? 'device error'
          });

      if (request.statusCode == 200) {
        var response = jsonDecode(request.body);

        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  loginUser({String? username, password}) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/login_user.php",
          ),
          body: {
            'username': username,
            'password': password,
            'fcm_token':
                SharedPref.localStorage!.getString('token') ?? 'device error'
          });

      if (request.statusCode == 200) {
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
