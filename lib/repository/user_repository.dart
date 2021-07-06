import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:getx_tracking/resource/resource.dart';
import 'package:getx_tracking/service/cache/cache_service.dart';

UserRepository get userRepo => UserRepository.shared();

class UserRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  String? accessToken;
  bool isSignedIn = false;

  static UserRepository? _sInstance;

  UserRepository._() {
    isSignedIn = cacheSrv.isSignedIn;
    auth.authStateChanges().listen((user) {});
  }

  factory UserRepository.shared() {
    if (_sInstance == null) {
      _sInstance = UserRepository._();
    }
    return _sInstance!;
  }

  static init() async {
    await Firebase.initializeApp();
  }

  void onAuthStateChanged(User? u) async {
    if (u == null) {
      //signout
      user = null;
      Get.offAllNamed(Routes.SIGN_IN);
    } else {
      user = u;
      accessToken = await user!.getIdToken();
    }
  }

  void signIn({
    required String email,
    required String password,
    Function(bool, String?)? callback,
  }) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
      accessToken = await user!.getIdToken();
      log('accessToken: ${accessToken}');

      callback?.call(true, '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
      callback?.call(false, e.message);
    }
  }
}
