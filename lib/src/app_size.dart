import 'package:flutter/cupertino.dart';

class AppSize {
  static width(context) {
    return MediaQuery.of(context).size.width;
  }

  static height(context) {
    return MediaQuery.of(context).size.height;
  }
}
