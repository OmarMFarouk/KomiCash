import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/game_bloc/game_cubit.dart';
import 'package:komiwall/blocs/game_bloc/game_states.dart';
import 'package:komiwall/components/general/background.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:komiwall/services/game_api/tap_war_api.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_shared.dart';
import 'package:komiwall/src/app_size.dart';

import '../../../components/home_comp/leads_tile.dart';
import '../../../src/app_navigation.dart';

class TapGame extends StatefulWidget {
  const TapGame({super.key});

  @override
  State<TapGame> createState() => _TapGameState();
}

class _TapGameState extends State<TapGame> {
  int score = 0;
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GameCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              const MyBackGround(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kToolbarHeight * 0.66,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () => AppNavigation.pop(context),
                        child: Image.asset(
                          'assets/icons/back.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Tap WARS',
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.amber,
                                fontSize: 32),
                          ),
                          const Text(
                            'USER WITH',
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.amber,
                                fontSize: 32),
                          ),
                          const Text(
                            'HIGHEST SCORE',
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.amber,
                                fontSize: 32),
                          ),
                          const Text(
                            'WINs',
                            style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 3,
                                color: Colors.redAccent),
                          ),
                          const Text(
                            '100 points',
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.amber,
                                fontSize: 25),
                          ),
                          Text(
                            'restarts daily',
                            style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.grey.shade400,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: kToolbarHeight * 0.5,
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.7,
                            child: Text(
                              'your highest score: ${SharedPref.localStorage!.getInt('tapwar') ?? 0}}',
                              style: const TextStyle(
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: kToolbarHeight * 1,
                          ),
                          GestureDetector(
                              onTapCancel: () {
                                setState(() {
                                  tapped = false;
                                });
                              },
                              onTapDown: (details) {
                                setState(() {
                                  tapped = true;
                                });
                              },
                              onTapUp: (details) {
                                setState(() {
                                  tapped = false;

                                  resetter();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: AppSize.width(context) * 0.6,
                                height: AppSize.height(context) * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(120, 120)),
                                  color: AppColor.blueP,
                                  border: tapped == false
                                      ? const Border(
                                          bottom: BorderSide(
                                          width: 15,
                                          color: AppColor.blueS,
                                        ))
                                      : null,
                                ),
                                child: Text(
                                  score == 0 ? 'TAP ME' : '$score',
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      fontWeight: FontWeight.bold,
                                      fontSize: score == 0 ? 35 : 60),
                                ),
                              )),
                          const SizedBox(
                            height: kTextTabBarHeight,
                          ),
                          const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('\t\tTOP PLAYERS TODAY')),
                          const SizedBox(
                            height: kTextTabBarHeight * 0.3,
                          ),
                          SizedBox(
                            height: kToolbarHeight * 0.75,
                            child: state is TapWarRefresh ||
                                    cubit.tapwarModel != null
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cubit
                                        .tapwarModel!.tapWarRanking!.length,
                                    itemBuilder: (context, index) => LeadTile(
                                      points: cubit.tapwarModel!
                                          .tapWarRanking![index]!.pointsearned!,
                                      username: cubit.tapwarModel!
                                          .tapWarRanking![index]!.username!,
                                    ),
                                  )
                                : const MyShimmer(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void resetter() {
    final random = Random();
    double stageOne =
        ((score + random.nextInt(score + 20 - score))).roundToDouble();
    double stageTwo =
        ((score + random.nextInt(score + 10 - score))).roundToDouble();
    double stageThree =
        ((score + random.nextInt(score + 5 - score))).roundToDouble();
    if (score <= 20) {
      if (score == stageOne) {
        if (score > (SharedPref.localStorage!.getInt('tapwar')!)) {
          SharedPref.localStorage!.setInt('tapwar', score);
          GameCubit.get(context).fetchRanking();
          TapWarApi().startGame(SharedPref.localStorage!.getInt('tapwar')!);
        }
        score = 0;
      } else {
        score = score + 1;
      }
    } else if (score <= 50) {
      if (score == stageOne || score == stageTwo) {
        if (score > (SharedPref.localStorage!.getInt('tapwar')!)) {
          SharedPref.localStorage!.setInt('tapwar', score);
          GameCubit.get(context).fetchRanking();
          TapWarApi().startGame(SharedPref.localStorage!.getInt('tapwar')!);
        }
        score = 0;
      } else {
        score = score + 1;
      }
    } else {
      if (score == stageOne || score == stageTwo || score == stageThree) {
        if (score > (SharedPref.localStorage!.getInt('tapwar')!)) {
          SharedPref.localStorage!.setInt('tapwar', score);
          GameCubit.get(context).fetchRanking();
          TapWarApi().startGame(SharedPref.localStorage!.getInt('tapwar')!);
        }
        score = 0;
      } else {
        score = score + 1;
      }
    }
  }
}
