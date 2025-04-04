import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gac/core/errors/custom_exceptions.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/services/database_service.dart';
import 'package:gac/core/services/firebase_auth_service.dart';
import 'package:gac/core/utils/backend_endpoints.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/features/auth/data/models/user_model.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String secondName,
      required String phoneNumber,
      required int points}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);

      if (!user.emailVerified) {
        return Left(ServerFailure(
            message: 'الرجاء تفعيل الحساب من خلال البريد الالكتروني'));
      }
      var userEntity = UserEntity(
          name: name,
          secondName: secondName,
          phoneNumber: phoneNumber,
          email: email,
          uId: user.uid,
          cartList: [],
          userLocations: [],
          points: points);
      await addUserData(userEntity: userEntity);
      await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }

      return Left(ServerFailure(message: mapException(e)));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }

      return Left(ServerFailure(message: 'حدث خطاء ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      userEntity.cartList = [];
      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: mapException(e)));
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      return Left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebase(user).toEntity();
      var isUserExist = await databaseService.checkIfDataExist(
          path: BackendEndpoints.getUserData, uId: user.uid);
      if (isUserExist) {
        var updateData = await getUserData(uId: user.uid);

        await saveUserData(userEntity: updateData);
        return Right(updateData);
      } else {
        await addUserData(userEntity: userEntity);
        await saveUserData(userEntity: userEntity);
        return Right(userEntity);
      }
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }

      return Left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user).toEntity();
      var isUserExist = await databaseService.checkIfDataExist(
          path: BackendEndpoints.getUserData, uId: user.uid);
      if (isUserExist) {
        var updatedUserEntity = await getUserData(uId: user.uid);

        // Save the fetched user data locally
        await saveUserData(userEntity: updatedUserEntity);
      } else {
        await addUserData(userEntity: userEntity);

        // Save the new user data locally
        await saveUserData(userEntity: userEntity);

        return Right(userEntity);
      }
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(message: mapException(e)));
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }

      return Left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await databaseService.addData(
        uId: userEntity.uId,
        path: BackendEndpoints.addUserData,
        data: UserModel.fromEntity(userEntity).toMap());
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoints.getUserData, documentId: uId);
    UserEntity userEntity = UserModel.fromJson(userData).toEntity();
    return userEntity;
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    var userData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await CacheHelper.saveData(key: kSaveUserDataKey, value: userData);
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      await firebaseAuthService.sendEmailToResetPassword(email: email);
      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserData(
      {required String uId,
      required String name,
      required String secondName,
      required String phoneNumber}) async {
    try {
      // Update user data in the database
      await databaseService.updateData(
        path: BackendEndpoints.addUserData,
        documentId: uId,
        data: {
          'name': name,
          'secondName': secondName,
          'phoneNumber': phoneNumber
        },
      );

      // Save updated user data to cache

      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(
          message: 'An unexpected error occurred while updating user data.'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      // Sign out the user
      await firebaseAuthService.signOut();

      // Remove cached user data

      // await CacheHelper.removeData(key: kSaveUserLocationKey);

      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(
          message: 'An unexpected error occurred while logging out.'));
    }
  }



@override
Future<Either<Failure, void>> deleteAccount({required String uId, String? password}) async {
  try {


    User? user =await getCurrentUser();

    // Re-authenticate user based on provider
    if (user.providerData.any((info) => info.providerId == 'password')) {
      if (password == null || password.isEmpty) {
        return Left(ServerFailure(message: "Password is required for account deletion"));
      }
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
    } else if (user.providerData.any((info) => info.providerId == 'google.com')) {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(ServerFailure(message: "Google re-authentication failed"));
      }
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await user.reauthenticateWithCredential(credential);
    }

    // ✅ Delete user data from Firestore first
    await databaseService.deleteData(
      path: BackendEndpoints.getUserData,
      uId: uId,
    );

    // ✅ Delete Firebase Auth user
    await firebaseAuthService.deleteUser();

    // ✅ Clear Local Cache
    await CacheHelper.removeData(key: kSaveUserDataKey);
    await CacheHelper.removeData(key: kSaveUserLocationKey);

    return const Right(null);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      return Left(ServerFailure(message: "Incorrect password"));
    } else if (e.code == 'user-mismatch') {
      return Left(ServerFailure(message: "User mismatch. Try signing in again"));
    } else {
      return Left(ServerFailure(message: "Re-authentication failed: ${e.message}"));
    }
  } catch (e) {
    return Left(ServerFailure(message: "Unexpected error: ${e.toString()}"));
  }
}
  @override
Future<User> getCurrentUser() async {
    return await firebaseAuthService.getCurrentUser();
  }

  @override
  Future<Either<Failure, void>> emptyCart({required String userId}) async {
    try {
      await databaseService.emptyCart(userId: userId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
