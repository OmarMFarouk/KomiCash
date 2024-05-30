import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:komiwall/blocs/cash_bloc/cash_cubit.dart';
import 'package:komiwall/src/app_color.dart';

import '../../src/app_size.dart';

// ignore: must_be_immutable
class CashoutDialog extends StatelessWidget {
  CashoutDialog(
      {super.key,
      required this.tierValue,
      required this.tierPoints,
      required this.method,
      required this.image});
  final String tierValue, tierPoints, method, image;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: AppSize.height(context) * 0.25,
      decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage('assets/images/template.jpg')),
        color: AppColor.blueP,
        borderRadius: BorderRadius.circular(15),
        border:
            const Border(bottom: BorderSide(color: AppColor.blueS, width: 10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Enter Your $method'),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.width(context) * 0.1),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(75),
                          right: Radius.circular(75))),
                  errorStyle: const TextStyle(color: AppColor.redS),
                  hintText: 'ID',
                  hintStyle:
                      TextStyle(fontSize: 17, color: Colors.grey.shade400),
                  filled: true,
                  fillColor: AppColor.blueP),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.text.isNotEmpty
                  ? CashCubit.get(context).cashoutRequest(
                      userInfo: controller.text,
                      amount: tierValue,
                      context: context,
                      method: method,
                      points: tierPoints,
                      methodImage: image)
                  : null;
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              width: AppSize.width(context) * 0.4,
              height: kToolbarHeight * 0.7,
              decoration: BoxDecoration(
                  border: const Border(
                      bottom: BorderSide(
                    width: 2,
                    color: AppColor.blueS,
                  )),
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.blue),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SPEND $tierPoints',
                    style: const TextStyle(fontSize: 15),
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
          )
        ],
      ),
    ));
  }
}
