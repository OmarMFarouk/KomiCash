import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/auth_bloc/auth_bloc/auth_cubit.dart';
import 'package:komiwall/blocs/auth_bloc/auth_bloc/auth_states.dart';
import 'package:komiwall/components/general/login_field.dart';
import 'package:komiwall/screens/auth/welcome_page.dart';
import 'package:komiwall/screens/index.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:komiwall/src/app_size.dart';

import '../../blocs/user_bloc/user_cubit.dart';
import '../../components/general/background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AssetImage myAssetImage;
  @override
  void initState() {
    super.initState();

    myAssetImage = const AssetImage(
      "assets/images/logo.gif",
    );
  }

  @override
  void dispose() {
    super.dispose();
    myAssetImage.evict(); //Evict image cache
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MyBackGround(),
        BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(state.msg)));
            UserCubit.get(context).fetchUserData();
            AppNavigation.pushR(context, const IndexPage());
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
                content: Text(state.errMsg)));
          }
        }, builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kToolbarHeight * 0.66,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () =>
                        AppNavigation.pushR(context, const WelcomePage()),
                    child: Image.asset(
                      'assets/icons/back.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Container(
                  height: AppSize.height(context) * 0.25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: myAssetImage,
                  )),
                ),
                const Center(
                    child: Text(
                  'WELCOME BACK',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                )),
                const SizedBox(
                  height: kToolbarHeight,
                ),
                Center(
                  child: Column(
                    children: [
                      LoginField(
                        obscure: false,
                        controller: cubit.username,
                        hint: 'username',
                      ),
                      const SizedBox(
                        height: kToolbarHeight / 2,
                      ),
                      LoginField(
                        obscure: true,
                        controller: cubit.password,
                        hint: 'password',
                      ),
                      const SizedBox(
                        height: kToolbarHeight,
                      ),
                      GestureDetector(
                        onTap: () {
                          cubit.username.text.isNotEmpty &&
                                  cubit.password.text.isNotEmpty
                              ? cubit.loginUser()
                              : null;
                        },
                        child: Container(
                          width: AppSize.width(context) * 0.7,
                          height: AppSize.height(context) * 0.1,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xFF0020FD),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(50, 5),
                                  top: Radius.elliptical(50, 6))),
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(letterSpacing: 1, fontSize: 50),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          );
        }),
      ],
    );
  }
}
