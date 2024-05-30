abstract class EarnStates {}

class EarnInitial extends EarnStates {}

class EarnSuccess extends EarnStates {}

class EarnError extends EarnStates {
  String errMsg = 'Something went wrong';
  EarnError(this.errMsg);
}

class LeadsFetched extends EarnStates {
  String msg = 'Success';
  LeadsFetched(this.msg);
}

class NetworksFetched extends EarnStates {
  String msg = 'Success';
  NetworksFetched(this.msg);
}

class HotNetworksFetched extends EarnStates {
  String msg = 'Success';
  HotNetworksFetched(this.msg);
}

class OffersFetched extends EarnStates {
  String msg = 'Success';
  OffersFetched(this.msg);
}
