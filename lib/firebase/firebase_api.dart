import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  FirebaseApi() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializeLocalNotifications();
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  getDeviceFirebaseToken() async {
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint("=================================================");
    debugPrint("Token: $fcmToken");
    debugPrint("=================================================");
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    getDeviceFirebaseToken();
    _onMessage();
  }

  _onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _showNotification(notification.title, notification.body);
      }
    });
  }

  Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      showWhen: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
}
