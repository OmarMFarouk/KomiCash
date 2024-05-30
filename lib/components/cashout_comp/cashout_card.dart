import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:komiwall/components/cashout_comp/cashout_dialog.dart';

import '../../src/app_color.dart';
import '../../src/app_size.dart';

class CashoutCard extends StatelessWidget {
  const CashoutCard(
      {super.key,
      required this.method,
      required this.tierPoints,
      required this.tierValue,
      required this.image});
  final String method, tierPoints, tierValue, image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.blueP,
            borderRadius: BorderRadius.circular(15),
            border: const Border(
                bottom: BorderSide(color: AppColor.blueS, width: 2))),
        child: Column(children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: kToolbarHeight * 2.15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(image),
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
              ),
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: AppSize.width(context) * 0.08,
                height: AppSize.height(context) * 0.03,
                decoration: BoxDecoration(
                    color: AppColor.blueP,
                    borderRadius: BorderRadius.circular(3)),
                child: Text(
                  tierValue + r'$',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(method),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CashoutDialog(
                        image: image,
                        tierPoints: tierPoints,
                        tierValue: tierValue,
                        method: method,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(2),
                    width: AppSize.width(context) * 0.175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.blue),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tierPoints,
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
                  ),
                ),
              ],
            ),
          ))
        ]));
  }
}
