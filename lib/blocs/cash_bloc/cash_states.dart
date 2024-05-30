abstract class CashStates {}

class CashInitial extends CashStates {}

class CashSuccess extends CashStates {
  String msg = 'Success';
  CashSuccess(this.msg);
}

class CashOutSuccess extends CashStates {
  String msg;
  CashOutSuccess(this.msg);
}

class CashOutError extends CashStates {
  String msg;
  CashOutError(this.msg);
}

class CashError extends CashStates {
  String errMsg = 'Something went wrong';
  CashError(this.errMsg);
}
