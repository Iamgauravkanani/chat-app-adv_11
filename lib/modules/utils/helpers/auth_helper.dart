import 'package:chat_app_11/modules/screens/login/model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static final AuthHelper authHelper = AuthHelper._();
  static FirebaseAuth auth = FirebaseAuth.instance;

  //todo:Anonymous login
  Future<Map<String, dynamic>> signInAninyymous() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  //todo:user sign up
  Future<Map<String, dynamic>> signUp(
      {required LoginCredentials credentials}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  // todo:user login with email and password
  Future<Map<String, dynamic>> signIn(
      {required LoginCredentials credentials}) async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }
  // todo:sign in with google
  // todo:mobile number authentication
}
