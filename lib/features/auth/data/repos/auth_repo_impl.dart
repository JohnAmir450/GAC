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
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
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
      var userEntity = UserEntity.fromFirebase(user);
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
      var userEntity = UserEntity.fromFirebase(user);
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
    await databaseService.addUserData(
        uId: userEntity.uId,
        path: BackendEndpoints.addUserData,
        data: userEntity.toMap());
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoints.getUserData, uId: uId);
    return UserEntity.fromJson(userData);
  }
  
  @override
  Future saveUserData({required UserEntity userEntity})async {
   var userData=jsonEncode(userEntity.toMap());
   await CacheHelper.saveData(key: kSaveUserDataKey, value: userData);
  }
}
