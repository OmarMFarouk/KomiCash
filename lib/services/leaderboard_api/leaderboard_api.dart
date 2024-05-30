import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class LeaderBoardApi {
  String baseUrl = "https://komiwall.com/app/public/leaderboard";
  fetchLeaderBoard() async {
    try {
      var request = await http.get(
        Uri.parse(
          "$baseUrl/leaderboard.php",
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
