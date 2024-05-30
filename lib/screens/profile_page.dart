import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/user_bloc/user_states.dart';
import 'package:komiwall/components/general/background.dart';
import 'package:komiwall/components/profile_comp/app_info_box.dart';
import 'package:komiwall/screens/auth/welcome_page.dart';
import '../blocs/user_bloc/user_cubit.dart';
import '../components/profile_comp/user_action_box.dart';
import '../components/profile_comp/user_details_box.dart';
import '../src/app_color.dart';
import '../src/app_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if (state is UserLogout) {
          AppNavigation.pushR(context, const WelcomePage());
        }
        if (state is UserSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.msg)));
          AppNavigation.pop(context);
        }
        if (state is UserError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMsg)));
        }
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              const MyBackGround(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: kToolbarHeight * 0.66),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(14),
                            highlightColor: AppColor.blueP,
                            onTap: () => AppNavigation.pop(context),
                            child: Image.asset(
                              'assets/icons/back.png',
                              height: 40,
                              width: 40,
                            ),
                          ),
                          IconButton(
                              highlightColor: AppColor.blueP,
                              tooltip: 'Logout',
                              onPressed: () => cubit.logoutUser(),
                              icon: const Icon(Icons.logout,
                                  color: AppColor.redP, size: 40)),
                        ],
                      ),
                      const SizedBox(height: kToolbarHeight * 0.66),
                      const Text('Account Details',
                          style:
                              // ignore: prefer_const_constructors
                              TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic)),
                      UserDetailsBox(cubit: cubit),
                      const Text('Account Actions',
                          style:
                              // ignore: prefer_const_constructors
                              TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic)),
                      UserActionsBox(cubit: cubit),
                      const Text('more',
                          style:
                              // ignore: prefer_const_constructors
                              TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic)),
                      AppInfoBox(cubit: cubit)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
