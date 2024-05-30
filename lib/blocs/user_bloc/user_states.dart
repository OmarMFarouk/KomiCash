abstract class UserStates {}

class UserInitial extends UserStates {}

class UserSuccess extends UserStates {
  String msg = 'Success';
  UserSuccess(this.msg);
}

class UserData extends UserStates {
  String msg = 'Success';
  UserData(this.msg);
}

class UserReset extends UserStates {
  String msg = 'Password changed';
}

class UserLogout extends UserStates {
  String msg = 'Logged out';
}

class UserError extends UserStates {
  String errMsg = 'Something went wrong';
  UserError(this.errMsg);
}

class CashoutMethods extends UserStates {
  String msg = 'Success';
  CashoutMethods(this.msg);
}
