import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/user_bloc/user_cubit.dart';
import 'package:komiwall/blocs/user_bloc/user_states.dart';
import 'package:komiwall/components/general/background.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_size.dart';

import '../components/wallet_comp/wallet_tile.dart';
import '../src/app_navigation.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MyBackGround(),
        BlocConsumer<UserCubit, UserStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = UserCubit.get(context);
            return Scaffold(
                extendBody: true,
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: kToolbarHeight * 0.66,
                        ),
                        Padding(
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
                        cubit.userDataModel != null
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: AppColor.blueP,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15, top: 20),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Expanded(
                                                child: Text(
                                              'Wallet Summary',
                                              style: TextStyle(fontSize: 12),
                                            )),
                                            Text(
                                              'Transactions:${cubit.userDataModel!.userleads!.length + cubit.userDataModel!.usercashouts!.length}',
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ]),
                                    ),
                                    ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: cubit.userDataModel!
                                                .usercashouts!.length +
                                            cubit.userDataModel!.userleads!
                                                .length,
                                        itemBuilder: (context, index) {
                                          if (index <
                                              cubit.userDataModel!.userleads!
                                                  .length) {
                                            return WalletTile(
                                              date: cubit.userDataModel!
                                                  .userleads![index]!.date!,
                                              index: index + 1,
                                              points: cubit.userDataModel!
                                                  .userleads![index]!.points!,
                                              status: !cubit
                                                      .userDataModel!
                                                      .userleads![index]!
                                                      .points!
                                                      .startsWith('-')
                                                  ? 'credit'
                                                  : 'chargeback',
                                              type: 'Task Reward',
                                              name: cubit
                                                  .userDataModel!
                                                  .userleads![index]!
                                                  .offername!,
                                              network: cubit.userDataModel!
                                                  .userleads![index]!.network!,
                                            );
                                          } else {
                                            int lastListIndex = index -
                                                cubit.userDataModel!.userleads!
                                                    .length;
                                            return WalletTile(
                                              network: 'cash out',
                                              name: cubit
                                                  .userDataModel!
                                                  .usercashouts![lastListIndex]!
                                                  .status!,
                                              date: cubit
                                                  .userDataModel!
                                                  .usercashouts![lastListIndex]!
                                                  .datecreated!,
                                              index: index + 1,
                                              points: cubit
                                                  .userDataModel!
                                                  .usercashouts![lastListIndex]!
                                                  .pointsused!,
                                              status: 'debit',
                                              type: 'cashout request',
                                            );
                                          }
                                        }),
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: AppSize.height(context),
                                child: const MyShimmer())
                      ]),
                ));
          },
        ),
      ],
    );
  }
}
