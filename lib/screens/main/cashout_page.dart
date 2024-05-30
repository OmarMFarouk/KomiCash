import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komiwall/blocs/cash_bloc/cash_cubit.dart';
import 'package:komiwall/blocs/cash_bloc/cash_states.dart';
import 'package:komiwall/components/cashout_comp/cashout_card.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:komiwall/src/app_size.dart';

class CashoutPage extends StatefulWidget {
  const CashoutPage({super.key});

  @override
  State<CashoutPage> createState() => _CashoutPageState();
}

class _CashoutPageState extends State<CashoutPage> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CashCubit, CashStates>(
      listener: (context, state) {
        if (state is CashOutSuccess) {
          AppNavigation.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green.shade700,
              duration: const Duration(seconds: 2),
              content: Text(state.msg)));
        }
        if (state is CashOutError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red.shade700,
              duration: const Duration(seconds: 3),
              content: Text(state.msg)));
        }
      },
      builder: (context, state) {
        var cubit = CashCubit.get(context);
        return Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: RefreshIndicator(
              backgroundColor: AppColor.blueP,
              color: AppColor.blueS,
              onRefresh: () async {
                cubit.fetchCashoutMethods();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Expanded(
                    child: SizedBox(
                      height: AppSize.height(context),
                      child: cubit.cashoutModel != null
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 160,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2),
                              scrollDirection: Axis.vertical,
                              itemCount: cubit.cashoutModel!.methods!.length,
                              itemBuilder: (context, index) => CashoutCard(
                                  method: cubit
                                      .cashoutModel!.methods![index].method!,
                                  tierPoints: cubit.cashoutModel!
                                      .methods![index].tierPoints!,
                                  tierValue: cubit
                                      .cashoutModel!.methods![index].tierValue!,
                                  image: cubit
                                      .cashoutModel!.methods![index].image!))
                          : const MyShimmer(),
                    ),
                  ),
                ]),
              ),
            ));
      },
    );
  }
}
