import 'dart:math';
import 'package:komiwall/blocs/game_bloc/game_cubit.dart';
import 'package:komiwall/blocs/user_bloc/user_cubit.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbspinningwheel/kbspinningwheel.dart';
import 'package:komiwall/components/game_comp/game_button.dart';
import 'package:komiwall/components/general/background.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_size.dart';

import '../../../src/app_navigation.dart';

class WheelGame extends StatefulWidget {
  const WheelGame({super.key});

  @override
  State<WheelGame> createState() => _WheelGameState();
}

class _WheelGameState extends State<WheelGame> {
  final StreamController _dividerController = StreamController<int>();
  bool spinned = false;
  final _wheelNotifier = StreamController<double>();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
    super.initState();
  }

  @override
  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const MyBackGround(),
          Container(
            height: AppSize.height(context) * 0.5,
            color: AppColor.blueP,
            width: AppSize.width(context) * 0.5,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kToolbarHeight * 0.66,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
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
                ),
                const Column(
                  children: [
                    Text(
                      'SPIN',
                      style: TextStyle(
                          letterSpacing: 3, color: Colors.amber, fontSize: 32),
                    ),
                    Text(
                      'TO WIN',
                      style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 3,
                          color: Colors.redAccent),
                    ),
                    Text(
                      'unlimited points',
                      style: TextStyle(
                          letterSpacing: 3, color: Colors.amber, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kToolbarHeight,
                ),
                SpinningWheel(
                  image: Image.asset('assets/images/wheel.png'),
                  width: AppSize.width(context) * 0.8,
                  height: AppSize.height(context) * 0.4,
                  initialSpinAngle: _generateRandomAngle(),
                  spinResistance: 0.6,
                  canInteractWhileSpinning: false,
                  dividers: 8,
                  onUpdate: _dividerController.add,
                  onEnd: _dividerController.add,
                  secondaryImage: Image.asset('assets/images/pointer.png'),
                  secondaryImageHeight: AppSize.height(context) * 0.3,
                  secondaryImageWidth: AppSize.width(context) * 0.2,
                  shouldStartOrStop: _wheelNotifier.stream,
                ),
                const SizedBox(height: 30),
                StreamBuilder(
                  stream: _dividerController.stream,
                  builder: (context, snapshot) => snapshot.hasData
                      ? RouletteScore(snapshot.data)
                      : Container(),
                ),
                const SizedBox(height: 30),
                UserCubit.get(context).userDataModel != null
                    ? UserCubit.get(context)
                                    .userDataModel!
                                    .userinfo!
                                    .spinnedToday ==
                                'false' &&
                            spinned == false
                        ? GameButton(
                            icon: 'repeat',
                            ontap: () async {
                              setState(() {
                                spinned = true;
                              });
                              GameCubit.get(context).startWheel();
                              Future.delayed(const Duration(seconds: 3), () {
                                GameCubit.get(context).endWheel(score);
                              });
                              return _wheelNotifier.sink
                                  .add(_generateRandomVelocity());
                            },
                            title: 'start')
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            alignment: Alignment.center,
                            width: AppSize.width(context) * 0.5,
                            child: const Text(
                              'You have already spinned for today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: AppColor.redP,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 22,
                                  letterSpacing: 3),
                            ),
                          )
                    : SizedBox(
                        height: AppSize.height(context) * 0.1,
                        width: AppSize.width(context) * 0.65,
                        child: const MyShimmer()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatefulWidget {
  final int selected;

  const RouletteScore(this.selected, {super.key});

  @override
  State<RouletteScore> createState() => _RouletteScoreState();
}

class _RouletteScoreState extends State<RouletteScore> {
  final Map<int, String> labels = {
    1: '80',
    2: '40',
    3: '0',
    4: '70',
    5: '50',
    6: '30',
    7: '20',
    8: '100',
  };
  @override
  void initState() {
    Timer timer;
    timer = Timer.periodic(const Duration(milliseconds: 50), (s) {
      setState(() {
        score = int.parse(labels[widget.selected]!);
      });
    });
    Future.delayed(const Duration(seconds: 10), () {
      timer.cancel();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${labels[widget.selected]}',
        style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}

late int score;
