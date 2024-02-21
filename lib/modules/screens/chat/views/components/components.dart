import 'dart:developer';
import 'package:chat_app_11/modules/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/strings.dart';
import '../../../login/views/components/components.dart';

TextFormField chatTextField() => TextFormField(
      cursorColor: black,
      controller: messageController,
      onChanged: (val) {
        message = val;
      },
      decoration: InputDecoration(
        suffixIcon: const IconButton(
          onPressed: sendBTN,
          icon: Icon(Icons.send),
        ),
        hintText: 'send message....',
        hintStyle: latoStyle(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
      ),
    );

sendBTN() {
  log("$message");
  messageController.clear();
}
