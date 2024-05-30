abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthSuccess extends AuthStates {
  String msg = 'Success';
  AuthSuccess(this.msg);
}

class AuthError extends AuthStates {
  String errMsg = 'Something went wrong';
  AuthError(this.errMsg);
}
