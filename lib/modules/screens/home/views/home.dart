import 'package:chat_app_11/modules/utils/helpers/cloudfirestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../utils/helpers/auth_helper.dart';
import 'components/home_components.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    logout() {
      AuthHelper.authHelper.signOut();
      Fluttertoast.showToast(msg: "Signed Out", textColor: Colors.black);
      Get.toNamed('/');
    }

    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: (AuthHelper.auth.currentUser?.displayName == null)
            ? Text(
                "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
              )
            : Text("${AuthHelper.auth.currentUser?.displayName}"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: logout, icon: const Icon(CupertinoIcons.arrow_up_bin))
        ],
      ),
      body: StreamBuilder(
        stream: CloudFireStoreHelper.fireStoreHelper.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? users =
                snapshot.data?.docs;
            return ListView.builder(
                itemCount: users?.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: ListTile(
                      onTap: onUserTap,
                      title: Text("${users?[i]['name']}"),
                      subtitle: Text("${users?[i]['email']}"),
                      leading: CircleAvatar(
                        radius: 30,
                        foregroundImage:
                            NetworkImage("${users?[i]['profile_picture']}"),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  onUserTap() {
    Get.toNamed('/chat');
  }
}
