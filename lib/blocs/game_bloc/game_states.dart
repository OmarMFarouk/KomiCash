abstract class GameStates {}

class GameInitial extends GameStates {}

class GameStart extends GameStates {
  String errMsg = 'Success';
  GameStart(this.errMsg);
}

class TapWarRefresh extends GameStates {}

class GameEnd extends GameStates {
  String errMsg = 'Success';
  GameEnd(this.errMsg);
}

class GameError extends GameStates {
  String errMsg = 'Something went wrong';
  GameError(this.errMsg);
}
