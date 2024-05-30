import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/user_bloc/user_cubit.dart';
import 'package:komiwall/models/cashout_model.dart';
import 'package:komiwall/services/cashout_api/cashout_api.dart';

import 'cash_states.dart';

class CashCubit extends Cubit<CashStates> {
  CashCubit() : super(CashInitial());
  static CashCubit get(context) => BlocProvider.of(context);
  CashoutModel? cashoutModel;
  fetchCashoutMethods() async {
    cashoutModel = await CashoutApi().fetchCashoutMethods().then((value) {
      return CashoutModel.fromJson(value);
    });
    emit(CashSuccess('Success'));
  }

  cashoutRequest(
      {required context,
      required amount,
      required points,
      required method,
      required methodImage,
      required userInfo}) async {
    if (int.parse(UserCubit.get(context).userDataModel!.userinfo!.balance!) >=
        int.parse(points)) {
      await CashoutApi()
          .cashoutRequest(
              method: method,
              amount: amount,
              pointsUsed: points,
              userInfo: userInfo.trim(),
              methodImage: methodImage)
          .then((value) {
        if (value['success'] == true) {
          emit(CashOutSuccess(value['message']));
        } else {
          emit(CashOutError(value['message']));
        }
      });
    } else {
      emit(CashOutError('Insufficient points'));
    }
  }
}
