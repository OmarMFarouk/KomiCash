import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/models/tapwar_ranking_model.dart';
import 'package:komiwall/services/game_api/scratch_api.dart';
import 'package:komiwall/services/game_api/tap_war_api.dart';
import 'package:komiwall/services/game_api/wheel_api.dart';

import 'game_states.dart';

class GameCubit extends Cubit<GameStates> {
  GameCubit() : super(GameInitial());
  static GameCubit get(context) => BlocProvider.of(context);
  TapWarRankingModel? tapwarModel;
  bool? isFirst = true;
  startWheel() async {
    await WheelApi().startGame().then((value) {
      if (value['success'] == true) {
        emit(GameStart(value['message']));
        isFirst = false;
      } else {
        emit(GameError(value['message']));
      }
    });
  }

  endWheel(points) {
    Future.delayed(const Duration(seconds: 1), () async {
      await WheelApi().endGame(points).then((value) {
        if (value['success'] == true) {
          emit(GameStart(value['message']));
          isFirst = false;
        } else {
          emit(GameError(value['message']));
        }
      });
    });
  }

  startScratch() async {
    await ScratchApi().startGame().then((value) {
      if (value['success'] == true) {
        emit(GameStart(value['message']));
        isFirst = false;
      } else {
        emit(GameError(value['message']));
      }
    });
  }

  restart() async {
    emit(GameEnd('errMsg'));
  }

  endScratch(points) async {
    ScratchApi().endGame(points).then((value) {
      if (value['success'] == true) {
        isFirst = true;
      } else {
        emit(GameError(value['message']));
      }
    });
  }

  fetchRanking() async {
    tapwarModel = await TapWarApi()
        .fetchRanking()
        .then((value) => TapWarRankingModel.fromJson(value))
        .whenComplete(() {
      emit(TapWarRefresh());
    });
  }
}
