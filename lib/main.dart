import 'dart:developer';

import 'package:chat_app_11/modules/screens/chat/views/chat.dart';
import 'package:chat_app_11/modules/screens/home/views/home.dart';
import 'package:chat_app_11/modules/screens/notification/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'modules/screens/login/views/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> FCM(RemoteMessage message) async {
  log("Handling a background message: ${message.notification?.title}");
  log("Handling a background message: ${message.notification?.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(FCM);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/notification',
      getPages: [
        GetPage(name: '/', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/chat', page: () => const ChatScreen()),
        GetPage(name: '/notification', page: () => const NotificationScreen()),
      ],
    ),
  );
}
