import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/earn_bloc/earn_cubit.dart';
import 'package:komiwall/blocs/earn_bloc/earn_states.dart';
import 'package:komiwall/components/earn_comp/network_dialog.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:komiwall/components/home_comp/leads_tile.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_shared.dart';

import '../../components/home_comp/featured_tile.dart';
import '../../components/home_comp/offerwall_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late AssetImage flameGIF;
late AssetImage moneyGIF;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    flameGIF = const AssetImage(
      "assets/images/flame.gif",
    );
    moneyGIF = const AssetImage(
      "assets/images/money.gif",
    );
  }

  @override
  void dispose() {
    super.dispose();
    flameGIF.evict();
    moneyGIF.evict();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EarnCubit, EarnStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = EarnCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: RefreshIndicator(
            backgroundColor: const Color.fromARGB(255, 4, 107, 138),
            color: AppColor.blueS,
            onRefresh: () async {
              cubit
                ..fetchLeads()
                ..fetchNetworks()
                ..fetchOffers();
            },
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight * 0.35,
                    ),
                    SizedBox(
                      height: kToolbarHeight * 0.75,
                      child: cubit.leadsModel != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.leadsModel!.leads!.length,
                              itemBuilder: (context, index) => LeadTile(
                                points:
                                    cubit.leadsModel!.leads![index]!.points!,
                                username:
                                    cubit.leadsModel!.leads![index]!.username!,
                              ),
                            )
                          : const MyShimmer(),
                    ),
                    const SizedBox(
                      height: kToolbarHeight * 0.75,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              image: DecorationImage(image: flameGIF)),
                        ),
                        const Text(
                          'Featured offers',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: kToolbarHeight * 0.5,
                    ),
                    SizedBox(
                      height: kToolbarHeight * 2.25,
                      child: cubit.youmiModel != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.youmiModel!.offers!.length,
                              itemBuilder: (context, index) => FeaturedTile(
                                title: cubit.youmiModel!.offers![index].name!,
                                image:
                                    cubit.youmiModel!.offers![index].iconUrl!,
                                url:
                                    '${cubit.youmiModel!.offers![index].trackinglink!}&aff_sub=${SharedPref.localStorage!.getString('username')}',
                              ),
                            )
                          : const MyShimmer(),
                    ),
                    const SizedBox(
                      height: kToolbarHeight * 0.7,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              image: DecorationImage(image: moneyGIF)),
                        ),
                        const Text(
                          'offer wall',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: kToolbarHeight * 0.25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: cubit.networksModel != null
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  cubit.networksModel!.offerwalls!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => NetworkDialog(
                                      title: cubit.networksModel!
                                          .offerwalls![index]!.name!,
                                      url: cubit.networksModel!
                                          .offerwalls![index]!.url!),
                                ),
                                child: OfferWallTile(
                                  image: cubit.networksModel!
                                      .offerwalls![index]!.image!,
                                  title: cubit
                                      .networksModel!.offerwalls![index]!.name!,
                                  starCount: int.parse(cubit.networksModel!
                                      .offerwalls![index]!.rate!),
                                  color: colorGen(cubit
                                      .networksModel!.offerwalls![index]!.skin),
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: double.infinity,
                              height: kToolbarHeight * 2.15,
                              child: MyShimmer()),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  colorGen(color) {
    switch (color) {
      case 'red':
        return [const Color(0xFF010029), const Color(0xFF87000A)];
      case 'blue':
        return [
          const Color(0xFF010029).withAlpha(0),
          const Color(0xFF003ECC),
        ];
      case 'gold':
        return [
          const Color(0xFF010029).withAlpha(0),
          const Color(0xFFC2950A),
        ];
      case 'vinous':
        return [
          const Color(0xFF010029).withAlpha(0),
          AppColor.secondary,
        ];
      case 'green':
        return [
          const Color(0xFF010029).withAlpha(0),
          const Color(0xFF31CE93),
        ];
      default:
        return [
          const Color(0xFF010029).withAlpha(0),
          AppColor.blueP,
        ];
    }
  }
}
