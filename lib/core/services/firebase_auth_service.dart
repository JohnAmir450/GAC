import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gac/core/errors/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: mapException(e));
    }catch (e){
    log('there was an Exception from Firebase Auth Service: ${e.toString()}');
    throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
  }
}
Future<User> signInWithEmailAndPassword({required String email, required String password}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  } on FirebaseAuthException catch (e) {
    throw CustomException(message: mapException(e));
  }catch (e){
    log('there was an Exception from Firebase Auth Service: ${e.toString()}');
    throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
  }
  }
  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: mapException(e));
    }catch (e){
      log('there was an Exception from Firebase Auth google Service: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }
}
