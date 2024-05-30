import 'package:flutter/material.dart';

import '../../blocs/user_bloc/user_cubit.dart';
import '../../src/app_color.dart';
import '../../src/app_size.dart';

class UserDetailsBox extends StatelessWidget {
  const UserDetailsBox({
    super.key,
    required this.cubit,
  });

  final UserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: AppSize.width(context),
      height: AppSize.height(context) * 0.215,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.blueP, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('username',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.03,
              decoration: BoxDecoration(
                  color: AppColor.blueS,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                cubit.userDataModel!.userinfo!.username!,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(letterSpacing: 1, fontSize: 12),
              )),
          const Text(
            'Balance',
            style:
                // ignore: prefer_const_constructors
                TextStyle(
                    letterSpacing: 1,
                    fontSize: 12,
                    fontStyle: FontStyle.italic),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.03,
              decoration: BoxDecoration(
                color: AppColor.blueS,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                cubit.userDataModel!.userinfo!.balance!,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(letterSpacing: 1, fontSize: 12),
              )),
          const Text('email',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.03,
              decoration: BoxDecoration(
                  color: AppColor.blueS,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                cubit.userDataModel!.userinfo!.email!,
                style:
                    // ignore: prefer_const_constructors
                    TextStyle(letterSpacing: 1, fontSize: 12),
              )),
        ],
      ),
    );
  }
}
