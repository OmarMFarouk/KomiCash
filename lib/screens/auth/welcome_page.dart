import 'package:flash_image/flash_image.dart';
import 'package:flutter/material.dart';
import 'package:komiwall/screens/auth/login_page.dart';
import 'package:komiwall/screens/auth/signup_page.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:komiwall/src/app_size.dart';

import '../../components/general/auth_button.dart';
import '../../components/general/background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MyBackGround(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.height(context) * 0.075,
                ),
                const FlashImage(
                  imgURL: 'assets/images/logo.png',
                ),
                const Center(
                    child: Text(
                  'EARN MONEY NOW',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                )),
                SizedBox(
                  height: AppSize.height(context) * 0.045,
                ),
                AuthButton(
                  icon: 'login',
                  title: 'login',
                  ontap: () {
                    AppNavigation.pushR(context, const LoginPage());
                  },
                ),
                SizedBox(
                  height: AppSize.height(context) * 0.045,
                ),
                AuthButton(
                  icon: 'email',
                  title: 'sign up',
                  ontap: () {
                    AppNavigation.pushR(context, const SignUpPage());
                  },
                ),
              ],
            )),
      ],
    );
  }
}
