import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:komiwall/src/app_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../blocs/user_bloc/user_cubit.dart';
import '../../src/app_color.dart';
import '../../src/app_shared.dart';
import '../../src/app_size.dart';

class AppInfoBox extends StatefulWidget {
  const AppInfoBox({
    super.key,
    required this.cubit,
  });

  final UserCubit cubit;

  @override
  State<AppInfoBox> createState() => _AppInfoBoxState();
}

class _AppInfoBoxState extends State<AppInfoBox> {
  @override
  void initState() {
    SharedPref.localStorage!.getBool('subs') ??
        SharedPref.localStorage!.setBool('subs', true);

    super.initState();
  }

  bool switcher = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: AppSize.width(context),
      height: AppSize.height(context) * 0.225,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.blueP, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('JOIN OUR COMMUNITY',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse('https://t.me/komiwall'),
                  mode: LaunchMode.externalApplication);
            },
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                width: AppSize.width(context),
                height: AppSize.height(context) * 0.03,
                decoration: BoxDecoration(
                    border: const Border(
                        bottom: BorderSide(color: AppColor.redP, width: 3)),
                    color: AppColor.blueS,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text('TELEGRAM')),
          ),
          const Text('VERSION',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          Row(
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  width: AppSize.width(context) * 0.6,
                  height: AppSize.height(context) * 0.03,
                  decoration: BoxDecoration(
                      color: AppColor.blueS,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    AppInfo.packageInfo!.version,
                    style:
                        // ignore: prefer_const_constructors
                        TextStyle(letterSpacing: 1, fontSize: 12),
                  )),
              InkWell(
                onTap: () => showModalBottomSheet(
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    backgroundColor: AppColor.blueP,
                    builder: (context) => SizedBox(
                          width: AppSize.width(context),
                          height: AppSize.height(context) * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    launchUrl(
                                        Uri.parse(
                                            'https://komiwall.com/privacy'),
                                        mode: LaunchMode.inAppWebView);
                                  },
                                  child: const Text(
                                    'PRIVACY POLICY',
                                    style: TextStyle(
                                      color: AppColor.background,
                                      fontSize: 12,
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    launchUrl(
                                        Uri.parse('https://komiwall.com/terms'),
                                        mode: LaunchMode.inAppWebView);
                                  },
                                  child: const Text(
                                    'TERMS AND CONDITIONS',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.background,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                    context: context),
                child: const Text('LEGAL',
                    style: TextStyle(
                      fontSize: 12,
                    )),
              )
            ],
          ),
          const Text('settings',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  width: AppSize.width(context) * 0.6,
                  height: AppSize.height(context) * 0.03,
                  decoration: BoxDecoration(
                      color: AppColor.blueS,
                      borderRadius: BorderRadius.circular(10)),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'receive announcements',
                    style: const TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
                  )),
              Expanded(
                child: Switch(
                  activeColor: AppColor.blueS,
                  value: SharedPref.localStorage!.getBool('subs')!,
                  onChanged: (s) {
                    setState(() async {
                      if (SharedPref.localStorage!.getBool('subs') == true) {
                        FirebaseMessaging.instance.unsubscribeFromTopic('all');
                      } else if (SharedPref.localStorage!.getBool('subs') ==
                          false) {
                        FirebaseMessaging.instance.subscribeToTopic('all');
                      }
                      setState(() {
                        SharedPref.localStorage!.setBool(
                            'subs', !SharedPref.localStorage!.getBool('subs')!);
                      });
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
