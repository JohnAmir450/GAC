import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isTermsChecked = false;
  Icon suffixIcon = const Icon(Icons.visibility);
  bool isObscured = true;

  void changePasswordVisibility() {
    isObscured = !isObscured;
    suffixIcon = isObscured
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(SingUpChangePasswordVisibility());
  }

  Future<void> createUserWithEmailAndPassword() async {
    emit(SignUpLoadingState());

    var result = await authRepo.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      secondName: secondNameController.text,
      phoneNumber: phoneNumberController.text,
      points: 0,
    );

    result.fold((failure) {
      emit(SignUpFailureState(message: failure.message));
    }, (user) async {
      emit(SignUpSuccessState(userEntity: user));
    });
  }

  Future<void> completeGoogleSignUp({required String userId}) async {
    emit(SignUpLoadingState());

    try {
      var userEntity = UserEntity(
        uId: userId,
        email: emailController.text,
        name: nameController.text,
        secondName: secondNameController.text,
        phoneNumber: phoneNumberController.text,
        points: 0,
      );

      var result = await authRepo.completeGoogleSignUp(userEntity: userEntity);

      result.fold((failure) {
        emit(SignUpFailureState(message: failure.message));
      }, (user) async {
        emit(SignUpSuccessState(userEntity: user));
      });
    } catch (e) {
      emit(SignUpFailureState(
          message: 'فشل في استكمال تسجيل الدخول: ${e.toString()}'));
    }
  }

    Future<void> deleteUserData(String uId) async {
    await authRepo.deleteAccount(uId: uId);
    
  }
}
