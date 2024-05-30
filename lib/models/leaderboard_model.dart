/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class FirstThree {
  String? username;
  String? pointsearned;

  FirstThree({this.username, this.pointsearned});

  FirstThree.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    pointsearned = json['points_earned'];
  }
}

class Rest {
  String? username;
  String? pointsearned;

  Rest({this.username, this.pointsearned});

  Rest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    pointsearned = json['points_earned'];
  }
}

class LeaderboardModel {
  bool? success;
  List<FirstThree?>? firstThree;
  List<Rest?>? rest;

  LeaderboardModel({this.success, this.firstThree, this.rest});

  LeaderboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['First_Three'] != null) {
      firstThree = <FirstThree>[];
      json['First_Three'].forEach((v) {
        firstThree!.add(FirstThree.fromJson(v));
      });
    }
    if (json['Rest'] != null) {
      rest = <Rest>[];
      json['Rest'].forEach((v) {
        rest!.add(Rest.fromJson(v));
      });
    }
  }
}
