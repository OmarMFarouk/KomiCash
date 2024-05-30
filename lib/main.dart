import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:komiwall/firebase_options.dart';
import 'package:komiwall/services/functional/firebase_api.dart';
import 'package:komiwall/services/functional/overrides.dart';
import 'package:komiwall/src/app_info.dart';
import 'package:komiwall/src/app_root.dart';

import 'src/app_shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await AppInfo().init();
  await AppInfo().developerVersion();

  SharedPref.localStorage!.setInt('tapwar', 0);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FirebaseNotification().initFCM();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppRoot());
}
