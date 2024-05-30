import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/user_bloc/user_cubit.dart';
import 'package:komiwall/components/general/background.dart';
import 'package:komiwall/components/general/warning_dialog.dart';
import 'package:komiwall/screens/main/cashout_page.dart';
import 'package:komiwall/screens/main/game_page.dart';
import 'package:komiwall/screens/main/home_page.dart';
import 'package:komiwall/screens/main/ranking_page.dart';
import 'package:komiwall/src/app_info.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:komiwall/src/app_shared.dart';

import '../components/general/my_appbar.dart';
import '../components/general/my_navbar.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

int _currentIndex = 1;
late PageController controller;

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    controller = PageController(initialPage: 1);
    BlocProvider(create: (context) => UserCubit()..fetchUserData());
    Future.delayed(const Duration(seconds: 3), () {
      BlocProvider(create: (context) => UserCubit()..logoutUser());
    });
    if (AppInfo.devVersion != AppInfo.packageInfo!.version) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => WarningDialog(
                  title: "New Version Is Available",
                  subTitle: "Please Update",
                  onTap: () => AppNavigation.pop(context),
                ));
      });
    }
    if (SharedPref.localStorage!.getBool('banned') == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => WarningDialog(
                  title: "You're Banned",
                  subTitle: 'For Breaking our terms AND conditions',
                  onTap: () => exit(0),
                ));
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MyBackGround(),
        Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: MyAppBar()),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: MyNavBar(
            currentIndex: _currentIndex,
            ontap: (index) {
              setState(() {
                _currentIndex = index;
              });
              controller.animateToPage(_currentIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutCubic);
            },
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const [
              RankingPage(),
              HomePage(),
              CashoutPage(),
              GamesPage(),
            ],
          ),
        ),
      ],
    );
  }
}
