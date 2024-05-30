// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/game_bloc/game_cubit.dart';
import 'package:komiwall/blocs/game_bloc/game_states.dart';
import 'package:komiwall/blocs/user_bloc/user_cubit.dart';
import 'package:komiwall/components/general/background.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_size.dart';
import 'package:scratcher/scratcher.dart';

import '../../../src/app_navigation.dart';

class ScratchGame extends StatefulWidget {
  const ScratchGame({super.key});

  @override
  _ScratchGameState createState() => _ScratchGameState();
}

class _ScratchGameState extends State<ScratchGame> {
  late ConfettiController _confettiController;
  final int _random = Random().nextInt(76);
  double _opacity = 0;
  bool enabled = true;
  bool _isScratched = false;

  List prizePool = [
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    25,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    40,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    10,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    140,
    200,
    400,
    1000,
  ];
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _isScratched = false;
    _isScratched = true;

    super.dispose();
  }

  declareWinner() {
    setState(() {
      _opacity = 1;
      _confettiController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameStates>(
      listener: (context, state) {
        if (state is GameEnd) {
          GameCubit.get(context).isFirst = true;
        }
        if (state is GameStart) {
          GameCubit.get(context).isFirst = false;
        }
        if (state is GameError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              content: Text(state.errMsg)));
        }
      },
      builder: (context, state) {
        var cubit = GameCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              const MyBackGround(),
              Column(
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
                  UserCubit.get(context).userDataModel != null
                      ? Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [
                                    Text(
                                      'Scratch',
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          color: Colors.amber,
                                          fontSize: 32),
                                    ),
                                    Text(
                                      'TO WIN',
                                      style: TextStyle(
                                          fontSize: 25,
                                          letterSpacing: 3,
                                          color: Colors.redAccent),
                                    ),
                                    Text(
                                      'UP TO',
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          color: Colors.amber),
                                    ),
                                    Text(
                                      '1000 points',
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          color: Colors.amber,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                                UserCubit.get(context)
                                            .userDataModel!
                                            .userinfo!
                                            .scratchedToday! ==
                                        'false'
                                    ? Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Scratcher(
                                            brushSize: 100,
                                            threshold: 40,
                                            accuracy: ScratchAccuracy.high,
                                            image: Image.asset(
                                              'assets/images/template.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                            enabled: !_isScratched,
                                            onScratchEnd: () {
                                              int x = prizePool[_random];
                                              cubit.startScratch();
                                              cubit.endScratch(x);
                                            },
                                            onThreshold: () {
                                              setState(() {
                                                _isScratched = true;
                                              });
                                              declareWinner();
                                            },
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              alignment: Alignment.center,
                                              color: AppColor.secondary,
                                              child: Text(
                                                prizePool[_random].toString(),
                                                style: const TextStyle(
                                                    color: AppColor.background,
                                                    fontSize: 60,
                                                    letterSpacing: 3),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'You have already scratched for today',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: AppColor.redP,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 22,
                                              letterSpacing: 3),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )
                      : const MyShimmer(),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: AppSize.height(context) * 0.18),
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _opacity,
                    child: Text(
                      "You Won!\n${prizePool[_random].toString()} Point",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.blueS,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirection: -pi / 3,
                  emissionFrequency: 0.01,
                  numberOfParticles: 10,
                  maximumSize: const Size(20, 10),
                  maxBlastForce: 40,
                  minBlastForce: 30,
                  gravity: 0.1,
                  shouldLoop: true,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
