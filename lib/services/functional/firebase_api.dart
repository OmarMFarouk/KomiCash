import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:komiwall/src/app_shared.dart';

Future<void> handleBackgroundMessage(RemoteMessage remoteMessage) async {
  log('title ${remoteMessage.notification!.title}');
  log('body ${remoteMessage.notification!.body}');
  log('payload ${remoteMessage.data}');
}

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'important notifications', importance: Importance.max);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initFCM() async {
    try {
      await _firebaseMessaging.requestPermission(
          alert: true,
          sound: true,
          badge: true,
          announcement: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true);
      final fCMToken = await _firebaseMessaging.getToken();
      if (SharedPref.localStorage!.getBool('subs') == true ||
          SharedPref.localStorage!.getBool('subs') == null) {
        await _firebaseMessaging.subscribeToTopic('all');
      }

      SharedPref.localStorage?.setString("token", "$fCMToken");
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
      FirebaseMessaging.onMessage.listen((event) {
        final notification = event.notification;
        if (notification == null) return;
        _localNotifications.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    importance: Importance.max,
                    priority: Priority.high,
                    _androidChannel.id,
                    _androidChannel.name,
                    channelDescription: _androidChannel.description,
                    icon: '@mipmap/ic_launcher')));
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
