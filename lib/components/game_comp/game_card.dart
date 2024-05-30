import 'package:flutter/material.dart';

import '../../src/app_color.dart';
import '../../src/app_size.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.ontap,
    required this.title,
    required this.image,
  });
  final VoidCallback ontap;
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          alignment: Alignment.topLeft,
          height: AppSize.height(context) * 0.15,
          width: AppSize.width(context),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: AssetImage(image)),
              color: AppColor.redP,
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.elliptical(10, 6),
                  right: Radius.elliptical(10, 6))),
          child: Container(
              padding: const EdgeInsets.all(5),
              color: AppColor.blueP,
              child: Text(title))),
    );
  }
}
