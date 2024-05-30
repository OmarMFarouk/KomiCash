import 'package:flutter/material.dart';

import '../../src/app_color.dart';
import '../../src/app_size.dart';

class AuthButton extends StatefulWidget {
  const AuthButton(
      {super.key,
      required this.icon,
      required this.ontap,
      required this.title});

  final String title, icon;
  final VoidCallback ontap;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          widget.ontap();
        });
      },
      child: Container(
        width: AppSize.width(context) * 0.7,
        height: AppSize.height(context) * 0.075,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.title == 'login' ? AppColor.redP : AppColor.blueP,
            border: tapped == false
                ? Border(
                    bottom: BorderSide(
                    width: 4,
                    color: widget.title == 'login'
                        ? AppColor.redS
                        : AppColor.blueS,
                  ))
                : null,
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.elliptical(50, 5),
                top: Radius.elliptical(50, 6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/${widget.icon}.png',
                scale: 0.8, color: AppColor.redS),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: AppSize.width(context) * 0.4,
              child: Text(
                widget.title,
                style: const TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
