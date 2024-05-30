class CashoutModel {
  List<Methods>? methods;

  CashoutModel({this.methods});

  CashoutModel.fromJson(Map<String, dynamic> json) {
    if (json['methods'] != null) {
      methods = <Methods>[];
      json['methods'].forEach((v) {
        methods!.add(Methods.fromJson(v));
      });
    }
  }
}

class Methods {
  String? id;
  String? method;
  String? image;
  String? tierValue;
  String? tierPoints;
  String? status;

  Methods(
      {this.id,
      this.method,
      this.image,
      this.tierValue,
      this.tierPoints,
      this.status});

  Methods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    method = json['method'];
    image = json['image'];
    tierValue = json['tier_value'];
    tierPoints = json['tier_points'];
    status = json['status'];
  }
}
