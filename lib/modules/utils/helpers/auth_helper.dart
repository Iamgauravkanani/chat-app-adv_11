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
  Future<Map<String, dynamic>> signUp() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: 'demo@gmail.com', password: '123456');
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  // todo:user login with email and password
  Future<Map<String, dynamic>> signIn() async {
    Map<String, dynamic> res = {};
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: 'demo@gmail.com', password: '123456');
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }
  // todo:sign in with google
  // todo:mobile number authentication
}
