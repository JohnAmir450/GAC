import 'package:dartz/dartz.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required String secondName,
      required String phoneNumber,
      required int points
      });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();  

  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity userEntity});

  Future<UserEntity> getUserData({required String uId});

  Future saveUserData({required UserEntity userEntity});

  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
 Future<Either<Failure, void>> updateUserData({required String uId,required String name,required String secondName, required String phoneNumber});

 Future<Either<Failure, void>> signOut();
 Future<Either<Failure,void>> deleteAccount({required String  uId});

 Future<Either<Failure, void>> emptyCart({required String userId});
}
