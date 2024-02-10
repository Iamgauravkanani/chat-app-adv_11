import 'package:chat_app_11/modules/screens/login/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/components.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            emailTextField(),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<LoginController>(
              builder: (_) => passwordTextField(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: myButtonStyle(),
              onPressed: login,
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: myButtonStyle(bg_color: Colors.blue),
              onPressed: login,
              child: Text(
                "Sign in with Google",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //todo:email field
  emailTextField() => TextFormField(
        controller: emailController,
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
//todo: password field
  passwordTextField() => TextFormField(
        obscureText: controller.password.isVisible,
        controller: passwordController,
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
