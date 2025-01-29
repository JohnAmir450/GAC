import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:gac/core/errors/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.sendEmailVerification();
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: mapException(e));
    } catch (e) {
     
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: mapException(e));
    } catch (e) {
     
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.toString());
    } catch (e) {
      
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);
      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: mapException(e));
    } catch (e) {
      
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> sendEmailToResetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      await GoogleSignIn().signOut();

      await FacebookAuth.instance.logOut();
    } catch (e) {
     
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }
}
