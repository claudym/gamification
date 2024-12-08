import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// TODO no estaba ni implementado en ninguna parte
class NotificationService {
  // final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  // final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  // Future<void> initialize() async {
  //   // Request permissions for iOS
  //   await _messaging.requestPermission();

  //   // Initialize local notifications
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);
  //   await _localNotificationsPlugin.initialize(initializationSettings);

  //   // Handle foreground messages
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     _showNotification(message);
  //   });

  //   // Handle background messages
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // }

  // Future<void> _showNotification(RemoteMessage message) async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'default_channel', // channelId
  //     'Default', // channelName
  //     channelDescription: 'Default channel for notifications',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await _localNotificationsPlugin.show(
  //     0,
  //     message.notification?.title,
  //     message.notification?.body,
  //     platformChannelSpecifics,
  //     payload: message.data['payload'],
  //   );
  // }

  // static Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   // Handle background notification
  //   print('Handling a background message: ${message.messageId}');
  // }
}
