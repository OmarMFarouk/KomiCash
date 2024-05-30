import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:komiwall/src/app_color.dart';
import 'package:komiwall/src/app_size.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedTile extends StatelessWidget {
  const FeaturedTile({
    super.key,
    required this.url,
    required this.title,
    required this.image,
  });
  final String url, title, image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        width: AppSize.width(context) * 0.215,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
            color: AppColor.blueP, borderRadius: BorderRadius.circular(7)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: kToolbarHeight * 1.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(image)),
                  color: AppColor.redP,
                  borderRadius: BorderRadius.circular(7)),
            ),
            SizedBox(
              height: kToolbarHeight * 0.5,
              child: Text(
                title,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: const TextStyle(fontSize: 9),
              ),
            )
          ],
        ),
      ),
    );
  }
}
