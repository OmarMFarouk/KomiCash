import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/services/user_api/user_api.dart';

import '../../models/user_data_model.dart';
import '../../src/app_shared.dart';
import 'user_states.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserModel? userDataModel;
  Timer? timer;
  fetchUserData() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      userDataModel = await UserDataApi().fetchUserData().then((value) {
        return UserModel.fromJson(value);
      });
      pointsListener(userDataModel);
      emit(UserData('Success'));
    });
  }

  pointsListener(userDataModel) {
    SharedPref.localStorage
        ?.setInt('balance', int.parse(userDataModel!.userinfo!.balance!));
  }

  resetPassword() async {
    if (passwordController.text.length >= 6 &&
        newPasswordController.text.length >= 6) {
      await UserDataApi()
          .resetPassword(SharedPref.localStorage!.getString('username'),
              passwordController.text, newPasswordController.text)
          .then((value) {
        if (value['success'] == true) {
          emit(UserSuccess(value['message']));
          passwordController.clear();
          newPasswordController.clear();
        } else {
          emit(UserError('Please try again'));
        }
      });
    }
  }

  changeEmail() async {
    if (passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6 &&
        emailController.text.isNotEmpty) {
      await UserDataApi()
          .changeEmail(SharedPref.localStorage!.getString('username'),
              passwordController.text, emailController.text)
          .then((value) {
        if (value['success'] == true) {
          emit(UserSuccess(value['message']));
          passwordController.clear();
          emailController.clear();
        } else {
          emit(UserError('Please try again'));
        }
      });
    }
  }

  deleteAccount() async {
    if (passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6) {
      await UserDataApi()
          .deleteAccount(SharedPref.localStorage!.getString('username'),
              passwordController.text)
          .then((value) {
        if (value['success'] == true) {
          emit(UserSuccess(value['message']));
          logoutUser();
          passwordController.clear();
        } else {
          emit(UserError(value['message']));
        }
      });
    }
  }

  logoutUser() async {
    await SharedPref.localStorage?.setBool('active', false);

    emit(UserLogout());
    timer!.cancel();
  }
}
