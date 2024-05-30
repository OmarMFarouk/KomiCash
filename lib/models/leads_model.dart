/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Lead {
  String? id;
  String? offername;
  String? points;
  String? date;
  String? username;
  String? network;

  Lead(
      {this.id,
      this.offername,
      this.points,
      this.date,
      this.username,
      this.network});

  Lead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offername = json['offer_name'];
    points = json['points'];
    date = json['date'];
    username = json['username'];
    network = json['network'];
  }
}

class LeadsModel {
  List<Lead?>? leads;

  LeadsModel({this.leads});

  LeadsModel.fromJson(Map<String, dynamic> json) {
    if (json['leads'] != null) {
      leads = <Lead>[];
      json['leads'].forEach((v) {
        leads!.add(Lead.fromJson(v));
      });
    }
  }
}
