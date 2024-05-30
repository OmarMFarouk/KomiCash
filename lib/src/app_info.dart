import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

class AppInfo {
  static PackageInfo? packageInfo;
  static String? devVersion;
  Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> developerVersion() async {
    var request =
        await http.get(Uri.parse('https://komiwall.com/app/version.php'));
    if (request.statusCode < 300) {
      var response = jsonDecode(request.body);
      devVersion = response['version'];
    }
  }
}
