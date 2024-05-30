import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../src/app_shared.dart';

class ScratchApi {
  String baseUrl = "https://komiwall.com/app/public/games/scratch";
  startGame() async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/game_start.php",
          ),
          body: {"username": SharedPref.localStorage!.getString('username')!});

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

  endGame(points) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/game_end.php?RV=$points",
          ),
          body: {
            "username": SharedPref.localStorage!.getString('username')!,
          });

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
