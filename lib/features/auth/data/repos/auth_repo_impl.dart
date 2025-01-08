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
      required String phoneNumber
      }) async {
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
      );
      await addUserData(userEntity: userEntity);
      await getUserData(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      userEntity.cartList=[];
      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
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
        await getUserData(uId: user.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }
      await saveUserData(userEntity: userEntity);
    
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(message: e.message));
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
        await getUserData(uId: user.uid);
      } else {
        await addUserData(userEntity: userEntity);
      }
      await saveUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(message: e.message));
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
  
}

