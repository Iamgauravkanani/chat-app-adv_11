// ignore_for_file: non_constant_identifier_names
import 'package:chat_app_11/modules/screens/login/controllers/login_controller.dart';
import 'package:chat_app_11/modules/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/strings.dart';
import 'components/components.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          "Login",
          style: poppinsStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://i.pinimg.com/originals/4e/79/b7/4e79b7a983c01df927b8d0f42e799b35.gif"),
              emailTextField(textEditingController: emailController),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<LoginController>(
                builder: (_) => passwordTextField(
                    textEditingController: passwordController),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: myButtonStyle(),
                onPressed: login,
                child: Text(
                  "Login",
                  style: poppinsStyle(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: myButtonStyle(bg_color: Colors.black),
                onPressed: aninymous,
                child: Text(
                  "Sign in Anonymously",
                  style: latoStyle(color: white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: myButtonStyle(bg_color: grey),
                onPressed: signup,
                child: Text("Sign Up", style: latoStyle(color: white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

//todo:Sign up User
  signup() {
    Get.defaultDialog(
        backgroundColor: white,
        title: "Chatters Hub",
        titleStyle: latoStyle(fontSize: 22),
        content: Column(
          children: [
            emailTextField(textEditingController: s_emailController),
            const SizedBox(
              height: 20,
            ),
            passwordTextField(textEditingController: s_passwordController),
          ],
        ),
        confirm: ElevatedButton(
          style: myButtonStyle(),
          onPressed: onRegister,
          child: Text("Register", style: latoStyle(color: white)),
        ));
  }

  //todo: password field
  passwordTextField({required TextEditingController textEditingController}) =>
      TextFormField(
        obscureText: controller.password.isVisible,
        controller: textEditingController,
        onChanged: (val) {
          password = val;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              controller.changeVisiblity();
            },
            icon: Icon(
              (controller.password.isVisible)
                  ? CupertinoIcons.eye
                  : CupertinoIcons.eye_slash,
            ),
          ),
          border: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          hintText: "enter password...",
          labelText: 'Password',
          labelStyle: textStyle(),
        ),
      );
}
