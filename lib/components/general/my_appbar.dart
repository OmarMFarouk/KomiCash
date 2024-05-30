import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/user_bloc/user_cubit.dart';
import 'package:komiwall/blocs/user_bloc/user_states.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:komiwall/screens/profile_page.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:komiwall/src/app_size.dart';

import '../../screens/wallet_page.dart';
import '../../src/app_color.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
        return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: cubit.userDataModel != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(14),
                        highlightColor: AppColor.blueP,
                        onTap: () =>
                            AppNavigation.push(context, const ProfilePage()),
                        child: Image.asset(
                          'assets/icons/profile.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.centerRight,
                              height: kToolbarHeight * 0.6,
                              width: AppSize.width(context) * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  shape: BoxShape.rectangle,
                                  color: AppColor.redP),
                              child: Text(
                                cubit.userDataModel!.userinfo!.balance ??
                                    'loading',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                          Image.asset(
                            'assets/icons/cash.png',
                            width: AppSize.width(context) * 0.2,
                          ),
                        ],
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(14),
                        highlightColor: AppColor.blueP,
                        onTap: () =>
                            AppNavigation.push(context, const WalletPage()),
                        child: Image.asset(
                          'assets/icons/wallet.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    width: double.infinity,
                    height: kToolbarHeight,
                    child: MyShimmer()));
      },
    );
  }
}
