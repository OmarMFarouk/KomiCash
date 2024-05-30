import 'package:flutter/material.dart';
import 'package:komiwall/src/app_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../services/functional/web_view_handler.dart';
import '../../src/app_color.dart';
import '../../src/app_shared.dart';
import '../../src/app_size.dart';

class NetworkDialog extends StatelessWidget {
  const NetworkDialog({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: AppColor.primary,
            ),
            width: AppSize.width(context),
            alignment: Alignment.centerLeft,
            height: AppSize.height(context) * 0.075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '\t$title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: title.length < 10 ? 35 : 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textColor),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                          tooltip: 'close',
                          icon: const Icon(
                            Icons.tab_outlined,
                            size: 35,
                            color: AppColor.background,
                          ),
                          onPressed: () => launchUrl(
                              Uri.parse(url.replaceAll(
                                  '{user_id}',
                                  SharedPref.localStorage!
                                      .getString('username')!)),
                              mode: LaunchMode.externalApplication),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                          tooltip: 'close',
                          icon: const Icon(
                            Icons.cancel,
                            size: 35,
                            color: AppColor.background,
                          ),
                          onPressed: () => AppNavigation.pop(context),
                        )),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: WebViewHandler(
                url: url.replaceAll('{user_id}',
                    SharedPref.localStorage!.getString('username')!)),
          )
        ],
      ),
    );
  }
}
