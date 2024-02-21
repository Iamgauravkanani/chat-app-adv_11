import 'package:chat_app_11/modules/screens/chat/model/chat_model.dart';
import 'package:chat_app_11/modules/utils/constants/strings.dart';
import 'package:chat_app_11/modules/utils/helpers/auth_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CloudFireStoreHelper {
  CloudFireStoreHelper._();

  static final CloudFireStoreHelper fireStoreHelper = CloudFireStoreHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser() async {
    await firestore
        .collection("users")
        .doc(AuthHelper.auth.currentUser?.uid)
        .set({
      'name': (AuthHelper.auth.currentUser?.displayName == null)
          ? "${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}"
          : "${AuthHelper.auth.currentUser?.displayName}",
      'email': AuthHelper.auth.currentUser?.email,
      'uid': AuthHelper.auth.currentUser?.uid,
      'profile_picture': (AuthHelper.auth.currentUser?.photoURL == null)
          ? profileImageDefault
          : "${AuthHelper.auth.currentUser?.photoURL}",
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    return firestore
        .collection('users')
        .where('uid', isNotEqualTo: AuthHelper.auth.currentUser?.uid)
        .snapshots();
  }

  sendMessage({required Chat chatdetails}) async {
    await firestore
        .collection("chat")
        .doc("${chatdetails.sender}_${chatdetails.receiver}")
        .set({
      "sentby": chatdetails.sender,
      "receivedby": chatdetails.receiver,
      "message": chatdetails.message,
      "timeStamp": FieldValue.serverTimestamp(),
    });
  }
}
