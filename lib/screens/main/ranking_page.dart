import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/leaderboard_bloc/leaderboard_cubit.dart';
import 'package:komiwall/blocs/leaderboard_bloc/leaderboard_states.dart';
import 'package:komiwall/components/general/shimmer.dart';

import '../../src/app_color.dart';
import '../../src/app_size.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaderBoardCubit, LeaderBoardStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LeaderBoardCubit.get(context);
        return Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: cubit.leaderboardModel != null
                ? RefreshIndicator(
                    backgroundColor: AppColor.blueP,
                    color: AppColor.blueS,
                    onRefresh: () async {
                      cubit.fetchLeaderBoard();
                    },
                    child: ListView(children: [
                      const SizedBox(
                        height: kToolbarHeight * 1.25,
                      ),
                      SizedBox(
                          height: AppSize.height(context) * 0.31,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                left: AppSize.width(context) * 0.195,
                                bottom: AppSize.height(context) * 0.15,
                                child: cubit.leaderboardModel!.firstThree!
                                            .length >=
                                        2
                                    ? TopBox(
                                        prize: '3k',
                                        username: cubit.leaderboardModel!
                                            .firstThree![1]!.username!)
                                    : const TopBox(prize: '3k', username: ''),
                              ),
                              Positioned(
                                bottom: AppSize.height(context) * 0.2,
                                child: cubit.leaderboardModel!.firstThree!
                                        .isNotEmpty
                                    ? TopBox(
                                        prize: '5K',
                                        username: cubit.leaderboardModel!
                                            .firstThree![0]!.username!)
                                    : const TopBox(prize: '5k', username: ''),
                              ),
                              Positioned(
                                right: AppSize.width(context) * 0.195,
                                bottom: AppSize.height(context) * 0.13,
                                child: cubit.leaderboardModel!.firstThree!
                                            .length >=
                                        3
                                    ? TopBox(
                                        prize: '2k',
                                        username: cubit.leaderboardModel!
                                            .firstThree![2]!.username!)
                                    : const TopBox(prize: '2k', username: ''),
                              ),
                              Image.asset(
                                'assets/icons/ranks.png',
                                height: AppSize.height(context) * 0.2,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: kToolbarHeight * 0.65,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: AppSize.height(context) * 0.1,
                          width: AppSize.width(context),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              color: AppColor.redP,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.elliptical(50, 7),
                                  right: Radius.elliptical(50, 7))),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: AppSize.width(context) * 0.33 - 20,
                                child: const Text(
                                  'rank',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: AppSize.width(context) * 0.33 - 20,
                                child: const Text(
                                  'name',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: AppSize.width(context) * 0.33 - 20,
                                child: const Text(
                                  'coins',
                                  style: TextStyle(fontSize: 22),
                                ),
                              )
                            ],
                          )),
                      cubit.leaderboardModel!.rest!.isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.leaderboardModel!.rest!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.blueP, width: 2),
                                    color: AppColor.blueP,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            AppSize.width(context) * 0.33 - 20,
                                        child: Text(
                                          '${index + 4}',
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          width: AppSize.width(context) * 0.33 -
                                              20,
                                          child: Text(
                                              cubit.leaderboardModel!
                                                  .rest![index]!.username!,
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: const TextStyle(
                                                  fontSize: 22))),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            AppSize.width(context) * 0.33 - 20,
                                        child: const Text(
                                          '100',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          : const SizedBox()
                    ]),
                  )
                : const MyShimmer());
      },
    );
  }
}

class TopBox extends StatelessWidget {
  const TopBox({
    super.key,
    required this.username,
    required this.prize,
  });
  final String username, prize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.height(context) * 0.085,
          width: AppSize.width(context) * 0.18,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColor.blueP,
              border: Border.all(color: AppColor.blueS, width: 2)),
          child: Text(
            username,
            style: const TextStyle(fontSize: 10, letterSpacing: 1),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              prize,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              width: 4,
            ),
            Image.asset(
              'assets/icons/coin.png',
              width: 12,
              height: 12,
            ),
          ],
        ),
      ],
    );
  }
}
