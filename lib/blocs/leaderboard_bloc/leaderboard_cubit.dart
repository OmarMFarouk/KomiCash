import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/leaderboard_bloc/leaderboard_states.dart';
import 'package:komiwall/models/leaderboard_model.dart';
import 'package:komiwall/services/leaderboard_api/leaderboard_api.dart';

class LeaderBoardCubit extends Cubit<LeaderBoardStates> {
  LeaderBoardCubit() : super(LeaderInitial());
  static LeaderBoardCubit get(context) => BlocProvider.of(context);
  LeaderboardModel? leaderboardModel;

  fetchLeaderBoard() async {
    leaderboardModel = await LeaderBoardApi().fetchLeaderBoard().then((value) {
      return LeaderboardModel?.fromJson(value);
    }).whenComplete(() => emit(LeaderSuccess()));
  }
}
