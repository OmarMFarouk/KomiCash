import 'package:flutter/material.dart';

import '../../src/app_color.dart';
import '../../src/app_size.dart';

class LoginField extends StatelessWidget {
  const LoginField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.obscure});
  final String hint;
  final bool obscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSize.width(context) * 0.7,
        height: AppSize.height(context) * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: hint == 'email' ? AppColor.redP : AppColor.blueP,
            border: Border(
                bottom: BorderSide(
              width: 4,
              color: hint == 'email' ? AppColor.redS : AppColor.blueS,
            )),
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.elliptical(50, 5),
                top: Radius.elliptical(50, 6))),
        child: TextField(
          obscureText: obscure,
          obscuringCharacter: '@',
          textInputAction:
              hint == 'username' ? TextInputAction.next : TextInputAction.done,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              prefixIcon: Icon(
                hint == 'email' ? Icons.mail_outline : Icons.lock_outline,
                color: Colors.black,
              ),
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ));
  }
}
