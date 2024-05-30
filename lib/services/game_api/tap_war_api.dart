import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../src/app_shared.dart';

class TapWarApi {
  String baseUrl = "https://komiwall.com/app/public/games/tap_war";
  startGame(int points) async {
    try {
      var request = await http.post(
          Uri.parse(
            "$baseUrl/game_start.php?points=$points",
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

  fetchRanking() async {
    try {
      var request = await http.get(
        Uri.parse(
          "https://komiwall.com/app/public/games/daily_ranking.php",
        ),
      );

      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        print(response);
        return response;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
