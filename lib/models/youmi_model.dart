class YoumiModel {
  int? c;
  int? total;
  int? page;
  int? pageSize;
  int? n;
  List<Offers>? offers;

  YoumiModel(
      {this.c, this.total, this.page, this.pageSize, this.n, this.offers});

  YoumiModel.fromJson(Map<String, dynamic> json) {
    c = json['c'];
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    n = json['n'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
  }
}

class Offers {
  String? id;
  String? name;
  String? package;
  String? kpi;
  String? adtxt;
  dynamic payout;
  int? cap;
  String? trackinglink;
  List<String>? country;
  List<String>? os;
  String? traffic;
  String? osVersion;
  List<Null>? carrier;
  List<Null>? device;
  String? previewUrl;
  String? iconUrl;
  List<Creative>? creative;
  List<Null>? video;
  List<String>? storeLabel;
  String? storeRating;
  String? size;
  Null conversionFlow;
  String? payoutType;
  MandatoryDevice? mandatoryDevice;
  String? conversionFlowDescription;
  String? streamType;
  String? trafficRegulation;
  Null trafficAlow;
  String? category;
  Null subsourceBlacklist;
  Null subsourceWhitelist;
  TaskDescriptionForUser? taskDescriptionForUser;
  Null events;

  Offers(
      {this.id,
      this.name,
      this.package,
      this.kpi,
      this.adtxt,
      this.payout,
      this.cap,
      this.trackinglink,
      this.country,
      this.os,
      this.traffic,
      this.osVersion,
      this.carrier,
      this.device,
      this.previewUrl,
      this.iconUrl,
      this.creative,
      this.video,
      this.storeLabel,
      this.storeRating,
      this.size,
      this.conversionFlow,
      this.payoutType,
      this.mandatoryDevice,
      this.conversionFlowDescription,
      this.streamType,
      this.trafficRegulation,
      this.trafficAlow,
      this.category,
      this.subsourceBlacklist,
      this.subsourceWhitelist,
      this.taskDescriptionForUser,
      this.events});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    package = json['package'];
    kpi = json['kpi'];
    adtxt = json['adtxt'];
    payout = json['payout'];
    cap = json['cap'];
    trackinglink = json['trackinglink'];
    country = json['country'].cast<String>();
    os = json['os'].cast<String>();
    traffic = json['traffic'];
    osVersion = json['os_version'];

    previewUrl = json['preview_url'];
    iconUrl = json['icon_url'];
    if (json['creative'] != null) {
      creative = <Creative>[];
      json['creative'].forEach((v) {
        creative!.add(Creative.fromJson(v));
      });
    }

    storeLabel = json['store_label'].cast<String>();
    storeRating = json['store_rating'];
    size = json['size'];
    conversionFlow = json['conversion_flow'];
    payoutType = json['payout_type'];
    mandatoryDevice = json['mandatory_device'] != null
        ? MandatoryDevice.fromJson(json['mandatory_device'])
        : null;
    conversionFlowDescription = json['conversion_flow_description'];
    streamType = json['stream_type'];
    trafficRegulation = json['traffic_regulation'];
    trafficAlow = json['traffic_alow'];
    category = json['category'];
    subsourceBlacklist = json['subsource_blacklist'];
    subsourceWhitelist = json['subsource_whitelist'];
    taskDescriptionForUser = json['task_description_for_user'] != null
        ? TaskDescriptionForUser.fromJson(json['task_description_for_user'])
        : null;
    events = json['events'];
  }
}

class Creative {
  String? url;
  String? mime;
  int? width;
  int? height;

  Creative({this.url, this.mime, this.width, this.height});

  Creative.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    mime = json['mime'];
    width = json['width'];
    height = json['height'];
  }
}

class MandatoryDevice {
  bool? imei;
  bool? mac;
  bool? andid;
  bool? advid;
  bool? idfa;
  bool? udid;

  MandatoryDevice(
      {this.imei, this.mac, this.andid, this.advid, this.idfa, this.udid});

  MandatoryDevice.fromJson(Map<String, dynamic> json) {
    imei = json['imei'];
    mac = json['mac'];
    andid = json['andid'];
    advid = json['advid'];
    idfa = json['idfa'];
    udid = json['udid'];
  }
}

class TaskDescriptionForUser {
  String? en;

  TaskDescriptionForUser({
    this.en,
  });

  TaskDescriptionForUser.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }
}
