import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/services/auth_api/auth_api.dart';
import 'package:komiwall/src/app_shared.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController username = TextEditingController();

  loginUser() async {
    AuthApi()
        .loginUser(password: password.text, username: username.text)
        .then((value) {
      if (value['success'] == true) {
        emit(AuthSuccess(value['message']));
        clearAndSave();
      } else if (value['success'] == false) {
        emit(AuthError(value['message']));
      } else if (value == 'error') {
        emit(AuthError('Check Internet Connection'));
      }
    });
  }

  registerUser() async {
    AuthApi()
        .registerUser(
      username: username.text,
      email: email.text,
      password: password.text,
    )
        .then((value) {
      if (value['success'] == true) {
        emit(AuthSuccess(value['message']));
        clearAndSave();
        SharedPref.localStorage!.setBool('subs', true);
      } else if (value['success'] == false) {
        emit(AuthError(value['message']));
      } else if (value == 'error') {
        emit(AuthError('Check Internet Connection'));
      }
    });
  }

  clearAndSave() async {
    await SharedPref.localStorage!.setBool('active', true);
    await SharedPref.localStorage!.setString('username', username.text);

    username.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    username.clear();
  }
}
