import 'dart:developer';
import 'package:chat_app_11/modules/screens/login/views/components/components.dart';
import 'package:chat_app_11/modules/utils/helpers/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.defaultDialog(
          title: "${message.notification?.title}",
          content: Text("${message.notification?.body}"));
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  getFCMToken() async {
    String? token = await messaging.getToken();
    log("FCM TOKEN :- ${token}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationHelper.notificationHelper.initNotification();
    FCM();
    getFCMToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper.simpleNotification();
                },
                style: myButtonStyle(),
                child: const Text(
                  "Simple Notification",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper
                      .showBigPictureNotification();
                },
                style: myButtonStyle(),
                child: const Text(
                  "Big Picture Notification",
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {
                  NotificationHelper.notificationHelper
                      .showNotificationMediaStyle();
                },
                style: myButtonStyle(),
                child: const Text(
                  "Media Style Notification",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
