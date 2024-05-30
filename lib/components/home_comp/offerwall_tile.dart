import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_size.dart';

class OfferWallTile extends StatelessWidget {
  const OfferWallTile({
    super.key,
    required this.color,
    required this.starCount,
    required this.title,
    required this.image,
  });
  final List<Color> color;
  final int starCount;
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      height: AppSize.height(context) * 0.125,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft, end: Alignment.topLeft, colors: color),
        border:
            const Border(bottom: BorderSide(color: AppColor.blueS, width: 2)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          children: [
            SizedBox(
              width: AppSize.width(context) * 0.175,
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  height: AppSize.height(context) * 0.1,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: color[1].withAlpha(250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(imageUrl: image)),
            ),
            SizedBox(
              width: AppSize.width(context) * 0.42,
              child: ListTile(
                title: Text(
                  'Offer wall',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
                subtitle: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 10,
                      color: AppColor.textColor,
                      letterSpacing: 2),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: AppSize.width(context) * 0.15,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: starCount,
                itemBuilder: (context, index) => const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
