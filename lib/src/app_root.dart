import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:komiwall/blocs/game_bloc/game_cubit.dart';
import 'package:komiwall/blocs/leaderboard_bloc/leaderboard_cubit.dart';
import 'package:komiwall/screens/auth/welcome_page.dart';
import 'package:komiwall/screens/index.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_shared.dart';

import '../blocs/auth_bloc/auth_bloc/auth_cubit.dart';
import '../blocs/cash_bloc/cash_cubit.dart';
import '../blocs/earn_bloc/earn_cubit.dart';
import '../blocs/user_bloc/user_cubit.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            if (SharedPref.localStorage?.getBool('active') == true) {
              return UserCubit()..fetchUserData();
            } else {
              return UserCubit();
            }
          }),
          BlocProvider(create: (context) {
            if (SharedPref.localStorage?.getBool('active') == true) {
              return LeaderBoardCubit()..fetchLeaderBoard();
            } else {
              return LeaderBoardCubit();
            }
          }),
          BlocProvider(
            create: (context) {
              if (SharedPref.localStorage?.getBool('active') == true) {
                return CashCubit()..fetchCashoutMethods();
              } else {
                return CashCubit();
              }
            },
          ),
          BlocProvider(create: (context) {
            if (SharedPref.localStorage?.getBool('active') == true) {
              return EarnCubit()
                ..fetchNetworks()
                ..fetchOffers()
                ..fetchLeads();
            } else {
              return EarnCubit();
            }
          }),
          BlocProvider(create: (context) {
            if (SharedPref.localStorage?.getBool('active') == true) {
              return GameCubit()..fetchRanking();
            } else {
              return GameCubit();
            }
          }),
          BlocProvider(create: (context) => AuthCubit())
        ],
        child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                bottomSheetTheme: const BottomSheetThemeData(
                    dragHandleColor: AppColor.background),
                fontFamily: 'Future-Socialism',
                textTheme: const TextTheme(
                        bodyLarge: TextStyle(), bodyMedium: TextStyle())
                    .apply(
                        bodyColor: AppColor.textColor,
                        displayColor: Colors.white)),
            home: child,
          ),
          child: SharedPref.localStorage!.getBool('active') == true
              ? const IndexPage()
              : const WelcomePage(),
        ));
  }
}
