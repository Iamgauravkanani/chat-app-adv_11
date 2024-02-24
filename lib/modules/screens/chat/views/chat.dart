import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/helpers/auth_helper.dart';
import '../../../utils/helpers/cloudfirestore_helper.dart';
import '../../login/views/components/components.dart';
import '../model/chat_model.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> arguments =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          foregroundImage: NetworkImage("${arguments[1]}"),
        ),
        title: Text("${arguments[0]}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: chatTextField(receiver: arguments[2]),
          ),
        ],
      ),
    );
  }

  TextFormField chatTextField({required String receiver}) => TextFormField(
        cursorColor: black,
        controller: messageController,
        onChanged: (val) {
          message = val;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              log("$message");

              Chat chat = Chat(
                message: message!,
                receiver: receiver,
                sender: AuthHelper.auth.currentUser!.uid,
              );
              CloudFireStoreHelper.fireStoreHelper
                  .sendMessage(chatdetails: chat);
              messageController.clear();
            },
            icon: Icon(Icons.send),
          ),
          hintText: 'send message....',
          hintStyle: latoStyle(),
          focusedBorder: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
        ),
      );
}
