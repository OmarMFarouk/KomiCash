import 'package:flutter/material.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_size.dart';

class LeadTile extends StatelessWidget {
  const LeadTile({
    super.key,
    required this.username,
    required this.points,
  });
  final String username, points;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(context) * 0.27,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
              left: Radius.elliptical(5, 6), right: Radius.elliptical(5, 6)),
          color: AppColor.blueP,
          border: Border(bottom: BorderSide(color: AppColor.blueS, width: 2))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            SizedBox(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: AppColor.redP,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: AppSize.width(context) * 0.175,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 10,
                      letterSpacing: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/coin.png',
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        points,
                        style: const TextStyle(fontSize: 8),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
