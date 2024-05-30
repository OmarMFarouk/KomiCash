abstract class LeaderBoardStates {}

class LeaderInitial extends LeaderBoardStates {}

class LeaderSuccess extends LeaderBoardStates {}

class LeaderError extends LeaderBoardStates {
  String errMsg = 'Something went wrong';
  LeaderError(this.errMsg);
}
