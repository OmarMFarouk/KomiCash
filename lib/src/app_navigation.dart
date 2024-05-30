import 'package:flutter/material.dart';

class AppNavigation {
  static push(context, destination) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  static pushR(context, destination) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => destination));
  }

  static pop(context) {
    Navigator.pop(context);
  }
}
