import 'package:flutter/material.dart';

import '../../src/app_color.dart';
import '../navbar_dep.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key, required this.currentIndex, required this.ontap});
  final int currentIndex;
  final Function ontap;
  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.redS, width: 3))),
      child: CustomNavBar(
        backgroundColor: AppColor.redP,
        onButtonPressed: (index) {
          widget.ontap(index);
        },
        activeColor: AppColor.blueP,
        selectedIndex: widget.currentIndex,
        barItems: [
          BarItem(
            icon: 'podium',
            title: 'Ranking',
          ),
          BarItem(
            icon: 'home',
            title: 'Home',
          ),
          BarItem(
            icon: 'bag',
            title: 'Cashout',
          ),
          BarItem(
            icon: 'game',
            title: 'Games',
          ),
        ],
      ),
    );
  }
}
