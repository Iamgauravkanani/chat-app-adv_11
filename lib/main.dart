import 'package:chat_app_11/modules/screens/chat/views/chat.dart';
import 'package:chat_app_11/modules/screens/home/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'modules/screens/chat/model/chat_model.dart';
import 'modules/screens/login/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => Login()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/chat', page: () => ChatScreen()),
      ],
    ),
  );
}
