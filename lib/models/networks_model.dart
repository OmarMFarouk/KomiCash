/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Offerwall {
  String? id;
  String? name;
  String? image;
  String? url;
  String? rate;
  String? status;
  String? skin;

  Offerwall(
      {this.id,
      this.name,
      this.image,
      this.url,
      this.rate,
      this.status,
      this.skin});

  Offerwall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    url = json['url'];
    rate = json['rate'];
    status = json['status'];
    skin = json['skin'];
  }
}

class NetworksModel {
  List<Offerwall?>? offerwalls;

  NetworksModel({this.offerwalls});

  NetworksModel.fromJson(Map<String, dynamic> json) {
    if (json['offerwalls'] != null) {
      offerwalls = <Offerwall>[];
      json['offerwalls'].forEach((v) {
        offerwalls!.add(Offerwall.fromJson(v));
      });
    }
  }
}
