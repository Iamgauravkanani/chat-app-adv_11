import 'package:chat_app_11/modules/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/helpers/auth_helper.dart';
import '../../../login/views/components/components.dart';

Widget myDrawer() {
  return Drawer(
    child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CircleAvatar(
          radius: 80,
          foregroundImage: (AuthHelper.auth.currentUser?.photoURL == null)
              ? NetworkImage(profileImageDefault)
              : NetworkImage("${AuthHelper.auth.currentUser?.photoURL}"),
        ),
        const Divider(),
        (AuthHelper.auth.currentUser?.displayName == null)
            ? Text(
                "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
              )
            : Text("${AuthHelper.auth.currentUser?.displayName}"),
        const Divider(),
        Text(
          "${AuthHelper.auth.currentUser?.email}",
          style: latoStyle(),
        ),
        const Divider(),
      ],
    ),
  );
}
