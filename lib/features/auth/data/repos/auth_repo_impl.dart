import 'package:dartz/dartz.dart';
import 'package:gac/core/errors/custom_exceptions.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/services/firebase_auth_service.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
  var user = await firebaseAuthService.createUserWithEmailAndPassword(
      email: email, password: password);
  return Right(UserEntity.fromFirebase(user));
} on CustomException catch (e) {
  return Left(ServerFailure(message: e.message));
}catch (e) {
  return Left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
}
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) async{
   try {
  var user =await  firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
  return Right(UserEntity.fromFirebase(user));
} on CustomException catch (e) {
  return Left(ServerFailure(message: e.message));
} catch (e) {
  return Left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
}
  }
}
