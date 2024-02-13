import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/constants/strings.dart';
import '../../../../utils/helpers/auth_helper.dart';
import '../../model/login_model.dart';

//todo:email field
emailTextField({required TextEditingController textEditingController}) =>
    TextFormField(
      controller: textEditingController,
      onChanged: (val) {
        email = val;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        hintText: "enter email...",
        labelText: 'Email',
        labelStyle: textStyle(),
      ),
    );

//todo:user register btn
onRegister() async {
  LoginCredentials credentials =
      LoginCredentials(email: email ?? "", password: password ?? "");
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signUp(credentials: credentials);
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Sign up failed", textColor: Colors.red);
  } else {
    s_emailController.clear();
    s_passwordController.clear();
    Fluttertoast.showToast(msg: "Sign up Success", textColor: Colors.black);
  }
}

//todo:login with email and password
login() async {
  LoginCredentials credentials =
      LoginCredentials(email: email!, password: password!);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signIn(credentials: credentials);
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Login failed", textColor: Colors.red);
  } else {
    emailController.clear();
    passwordController.clear();
    Get.back();
    Fluttertoast.showToast(msg: "Login Success", textColor: Colors.black);
  }
}

//todo:login button click
aninymous() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.signInAninyymous();
  if (res['error'] != null) {
    log("login failed");
  } else {
    log("login success");
  }
}

//todo: buttonstyle
myButtonStyle({Color bg_color = Colors.orange}) {
  return ButtonStyle(
    elevation: const MaterialStatePropertyAll(10),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textStyle: const MaterialStatePropertyAll<TextStyle>(
      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    backgroundColor: MaterialStatePropertyAll(bg_color),
    minimumSize: const MaterialStatePropertyAll(
      Size(350, 50),
    ),
  );
}

//todo:outline border
OutlineInputBorder outlineInputBorder() => const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );

//todo:lato textstyle
TextStyle latoStyle({double fontSize = 18, Color color = Colors.black}) =>
    GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
    );

//todo:poppins textstyle
TextStyle poppinsStyle(
        {double fontSize = 18,
        Color color = Colors.black,
        FontWeight fontWeight = FontWeight.normal}) =>
    GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
//todo:labeltextstyle
TextStyle textStyle({double fontSize = 14}) => const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
