class UserModel {
  bool? status;
  String? message;
  UserInfo? userinfo;
  List<UserCashout?>? usercashouts;
  List<UserLead?>? userleads;

  UserModel(
      {this.status,
      this.message,
      this.userinfo,
      this.usercashouts,
      this.userleads});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userinfo = json['user_info'] != null
        ? UserInfo?.fromJson(json['user_info'])
        : null;
    if (json['user_cashouts'] != null) {
      usercashouts = <UserCashout>[];
      json['user_cashouts'].forEach((v) {
        usercashouts!.add(UserCashout.fromJson(v));
      });
    }
    if (json['user_leads'] != null) {
      userleads = <UserLead>[];
      json['user_leads'].forEach((v) {
        userleads!.add(UserLead.fromJson(v));
      });
    }
  }
}

class UserCashout {
  String? id;
  String? username;
  String? method;
  String? pointsused;
  String? userinfo;
  String? datecreated;
  String? status;
  String? methodimage;
  String? datecompleted;
  String? amount;

  UserCashout(
      {this.id,
      this.username,
      this.method,
      this.pointsused,
      this.userinfo,
      this.datecreated,
      this.status,
      this.methodimage,
      this.datecompleted,
      this.amount});

  UserCashout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    method = json['method'];
    pointsused = json['points_used'];
    userinfo = json['user_info'];
    datecreated = json['date_created'];
    status = json['status'];
    methodimage = json['method_image'];
    datecompleted = json['date_completed'];
    amount = json['amount'];
  }
}

class UserInfo {
  String? id;
  String? username;
  String? password;
  String? lastlogin;
  String? datecreated;
  String? balance;
  String? status;
  String? lastip;
  String? firstip;
  String? email;
  String? deviceinfo;
  String? fcmtoken;
  String? pointsearned;
  String? countrycode;
  String? scratchedToday;
  String? spinnedToday;

  UserInfo(
      {this.id,
      this.username,
      this.password,
      this.lastlogin,
      this.datecreated,
      this.balance,
      this.status,
      this.lastip,
      this.firstip,
      this.email,
      this.deviceinfo,
      this.fcmtoken,
      this.pointsearned,
      this.countrycode,
      this.scratchedToday,
      this.spinnedToday});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    lastlogin = json['last_login'];
    datecreated = json['date_created'];
    balance = json['balance'];
    status = json['status'];
    lastip = json['last_ip'];
    firstip = json['first_ip'];
    email = json['email'];
    deviceinfo = json['device_info'];
    fcmtoken = json['fcm_token'];
    pointsearned = json['points_earned'];
    countrycode = json['country_code'];
    scratchedToday = json['scratched_today'];
    spinnedToday = json['spinned_today'];
  }
}

class UserLead {
  String? id;
  String? offername;
  String? points;
  String? date;
  String? username;
  String? network;

  UserLead(
      {this.id,
      this.offername,
      this.points,
      this.date,
      this.username,
      this.network});

  UserLead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offername = json['offer_name'];
    points = json['points'];
    date = json['date'];
    username = json['username'];
    network = json['network'];
  }
}
