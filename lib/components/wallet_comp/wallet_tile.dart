import 'package:flutter/material.dart';

import '../../src/app_color.dart';
import '../../src/app_navigation.dart';
import '../../src/app_size.dart';

class WalletTile extends StatelessWidget {
  const WalletTile(
      {super.key,
      required this.index,
      required this.type,
      required this.points,
      required this.status,
      required this.network,
      required this.name,
      required this.date});
  final int index;
  final String type, points, status, network, name, date;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: AppColor.blueS.withAlpha(50),
        borderRadius: BorderRadius.circular(200),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                  backgroundColor: AppColor.blueP.withAlpha(220),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      width: AppSize.width(context),
                      height: AppSize.height(context) * 0.36,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  color: AppColor.background,
                                  onPressed: () => AppNavigation.pop(context),
                                  icon: const Icon(Icons.close)),
                            ),
                            const Text('type',
                                style:
                                    // ignore: prefer_const_constructors
                                    TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                            Row(children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  width: AppSize.width(context) * 0.61,
                                  height: AppSize.height(context) * 0.03,
                                  decoration: BoxDecoration(
                                      color: AppColor.blueS,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(status,
                                      style:
                                          // ignore: prefer_const_constructors
                                          TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic)))
                            ]),
                            const Text('network',
                                style:
                                    // ignore: prefer_const_constructors
                                    TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                            Row(children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  width: AppSize.width(context) * 0.61,
                                  height: AppSize.height(context) * 0.03,
                                  decoration: BoxDecoration(
                                      color: AppColor.blueS,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(network,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic)))
                            ]),
                            Text(status == 'debit' ? 'status' : 'task',
                                style:
                                    // ignore: prefer_const_constructors
                                    const TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                            Row(children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  width: AppSize.width(context) * 0.61,
                                  height: AppSize.height(context) * 0.03,
                                  decoration: BoxDecoration(
                                      color: AppColor.blueS,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(name,
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style:
                                          // ignore: prefer_const_constructors
                                          TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic)))
                            ]),
                            const Text('date',
                                style:
                                    // ignore: prefer_const_constructors
                                    TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                            Row(children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  width: AppSize.width(context) * 0.61,
                                  height: AppSize.height(context) * 0.03,
                                  decoration: BoxDecoration(
                                      color: AppColor.blueS,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(date,
                                      style:
                                          // ignore: prefer_const_constructors
                                          const TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 15,
                                              fontStyle: FontStyle.italic)))
                            ])
                          ]))));
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColor.blueS),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: AppSize.width(context) * 0.1,
                alignment: Alignment.center,
                child: Text(
                  index.toString(),
                )),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    type,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  )),
            ),
            Expanded(
              child:
                  Container(alignment: Alignment.center, child: Text(points)),
            ),
            Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    status,
                    style: TextStyle(
                        color: status == 'debit' || status == 'chargeback'
                            ? AppColor.redS
                            : AppColor.primary),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
