import 'package:flutter/material.dart';
import 'package:komiwall/screens/main/games/scratch_game.dart';
import 'package:komiwall/screens/main/games/tap_game.dart';
import 'package:komiwall/screens/main/games/wheel_game.dart';
import 'package:komiwall/src/app_navigation.dart';
import '../../components/game_comp/game_card.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          const SizedBox(
            height: kToolbarHeight * 0.4,
          ),
          GameCard(
            ontap: () => AppNavigation.push(context, const TapGame()),
            title: 'TAP WAR',
            image: 'assets/images/tapwar_bg.jpg',
          ),
          GameCard(
            ontap: () => AppNavigation.push(context, const WheelGame()),
            title: 'Luck Wheel',
            image: 'assets/images/wheel_bg.jpg',
          ),
          GameCard(
            ontap: () => AppNavigation.push(context, const ScratchGame()),
            title: 'SCRATCH CARD',
            image: 'assets/images/scratch_bg.jpg',
          ),
        ]));
  }
}
