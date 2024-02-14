import 'package:chat_app_11/modules/screens/login/model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  AuthHelper._();
  static final AuthHelper authHelper = AuthHelper._();
  static FirebaseAuth auth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();

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
  Future<Map<String, dynamic>> googleSignin() async {
    Map<String, dynamic> res = {};
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      res['user'] = userCredential.user;
    } on FirebaseAuthException catch (e) {
      res['error'] = e.code;
    }
    return res;
  }

  Future<void> signOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
  // todo:mobile number authentication
}
