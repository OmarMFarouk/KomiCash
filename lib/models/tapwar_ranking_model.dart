/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class TapWarRankingModel {
  bool? success;
  String? message;
  List<TapWarRanking?>? tapWarRanking;

  TapWarRankingModel({this.success, this.message, this.tapWarRanking});

  TapWarRankingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['TapWar_Ranking'] != null) {
      tapWarRanking = <TapWarRanking>[];
      json['TapWar_Ranking'].forEach((v) {
        tapWarRanking!.add(TapWarRanking.fromJson(v));
      });
    }
  }
}

class TapWarRanking {
  String? id;
  String? game;
  String? username;
  String? pointsearned;
  String? date;

  TapWarRanking(
      {this.id, this.game, this.username, this.pointsearned, this.date});

  TapWarRanking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    game = json['game'];
    username = json['username'];
    pointsearned = json['points_earned'];
    date = json['date'];
  }
}
