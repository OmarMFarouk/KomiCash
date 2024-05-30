import 'package:flutter/material.dart';
import 'package:komiwall/src/app_color.dart';

import '../../src/app_size.dart';

class MyBackGround extends StatelessWidget {
  const MyBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(context),
      height: AppSize.height(context),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
            AppColor.primary,
            AppColor.primary,
            AppColor.secondary
          ])),
    );
  }
}
