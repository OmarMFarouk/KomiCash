import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../src/app_shared.dart';

class UserDataApi {
  String baseUrl = "https://komiwall.com/app/public";
  fetchUserData() async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/user_data.php",
          ),
          body: {"username": SharedPref.localStorage!.getString('username')!});

      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        if (response['user_info']['status'] == 'banned') {
          SharedPref.localStorage!.setBool('banned', true);
        }
        if (response['user_info']['status'] == 'normal') {
          SharedPref.localStorage!.setBool('banned', false);
        }
        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  resetPassword(username, password, newPassword) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/auth/reset_password.php",
          ),
          body: {
            'username': username,
            'password': password,
            'newpass': newPassword
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

  changeEmail(username, password, email) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/auth/change_email.php",
          ),
          body: {'username': username, 'password': password, 'email': email});

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

  deleteAccount(username, password) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/auth/delete_account.php",
          ),
          body: {'username': username, 'password': password});

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
