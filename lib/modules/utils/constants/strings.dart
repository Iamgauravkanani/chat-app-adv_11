import 'package:flutter/material.dart';

//todo:login screen strings
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController sEmailController = TextEditingController();
TextEditingController sPasswordController = TextEditingController();
String? email;
String? password;

String profileImageDefault =
    "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png";

TextEditingController messageController = TextEditingController();
String? message;
Stream? fetchedmsg;
