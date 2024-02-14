import 'package:chat_app_11/modules/utils/helpers/auth_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 80,
              foregroundImage:
                  NetworkImage("${AuthHelper.auth.currentUser?.photoURL}"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: (AuthHelper.auth.currentUser?.displayName == null)
            ? Text(
                "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
              )
            : Text(
                //"${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
                "${AuthHelper.auth.currentUser?.displayName}",
              ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: logout, icon: Icon(CupertinoIcons.arrow_up_bin))
        ],
      ),
    );
  }

  logout() {
    AuthHelper.authHelper.signOut();
    Fluttertoast.showToast(msg: "Signed Out", textColor: Colors.black);
    Get.offAndToNamed('/');
  }
}
