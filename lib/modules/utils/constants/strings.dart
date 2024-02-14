import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/auth_helper.dart';

//todo:login screen strings
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController sEmailController = TextEditingController();
TextEditingController sPasswordController = TextEditingController();
String? email;
String? password;

//todo:homescreen strings
String userName =
    "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}";
String userEmail = "${AuthHelper.auth.currentUser?.email}";
String userProfile = "${AuthHelper.auth.currentUser?.photoURL}";
String displayName = "${AuthHelper.auth.currentUser?.displayName}";
