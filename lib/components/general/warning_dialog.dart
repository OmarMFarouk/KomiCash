import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:komiwall/src/app_size.dart';

import '../../src/app_color.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
  final String title, subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        child: SizedBox(
          width: AppSize.width(context) * 0.5,
          height: AppSize.height(context) * 0.33,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColor.blueP,
                    border: const Border(
                        bottom: BorderSide(color: AppColor.blueS, width: 3)),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 30),
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: AppColor.redP,
                              border: const Border(
                                  bottom: BorderSide(
                                      color: AppColor.redS, width: 3)),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'OKAY',
                            style: TextStyle(
                                color: AppColor.background, letterSpacing: 3),
                          )),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
