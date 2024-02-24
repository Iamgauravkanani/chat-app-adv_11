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

  Future<void> sendMessage({required Chat chatdetails}) async {
    //todo:my current user
    String u1 = chatdetails.sender;
    String u2 = chatdetails.receiver;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('chat').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> fetchedChatID =
        querySnapshot.docs;
    bool isChatRoomAvailable = false;
    String fetchedUser1 = '';
    String fetchedUser2 = '';
    for (QueryDocumentSnapshot element in fetchedChatID) {
      String user1 = element.id.split('_')[0];
      String user2 = element.id.split('_')[1];
      if ((user1 == u1 || user1 == u2) && (user2 == u1 || user2 == u2)) {
        isChatRoomAvailable = true;
        fetchedUser1 = element.id.split('_')[0];
        fetchedUser2 = element.id.split('_')[1];
      }
    }
    if (isChatRoomAvailable) {
      await firestore
          .collection('chat')
          .doc('${fetchedUser1}_${fetchedUser2}')
          .collection('message')
          .add({
        "sentby": chatdetails.sender,
        "receivedby": chatdetails.receiver,
        "message": chatdetails.message,
        "timestamp": FieldValue.serverTimestamp(),
      });
    } else {
      await firestore
          .collection("chat")
          .doc("${chatdetails.sender}_${chatdetails.receiver}")
          .collection("message")
          .add({
        "sentby": chatdetails.sender,
        "receivedby": chatdetails.receiver,
        "message": chatdetails.message,
        "timestamp": FieldValue.serverTimestamp(),
      });
    }
  }
}
