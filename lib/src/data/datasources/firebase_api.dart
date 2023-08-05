import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/app_router.dart';
import '../../config/router/app_router_constants.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // print('Title: ${message.notification?.title}');
  // print('Body: ${message.notification?.body}');
  // print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notification',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    rootNavigatorKey.currentState?.context
        .pushNamed(AppRoutConstants.notificationView.name, queryParameters: {
      'message': message.notification?.body,
    });
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notificaiton = message.notification;
      if (notificaiton == null) return;

      _localNotifications.show(
        notificaiton.hashCode,
        notificaiton.title,
        notificaiton.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotifications() async {
    // const iOS = DarwinInitializationSettings();//
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(
      android: android,
      // iOS: iOS
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) {
        final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
        handleMessage(message);
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    // final fCMToken =
    await _firebaseMessaging.getToken();
    // print('Token: $fCMToken');
    initPushNotifications();
    initLocalNotifications();
    _firebaseMessaging.subscribeToTopic('fcm-notification');
  }
}
