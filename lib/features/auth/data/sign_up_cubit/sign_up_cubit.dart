import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
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
  Timer? verificationTimer;

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
      if (failure.message == 'الرجاء تفعيل الحساب من خلال البريد الالكتروني') {
        // Emit verification state
        emit(SignUpVerificationSentState());

        verificationTimer =
            Timer.periodic(const Duration(seconds: 5), (timer) async {
          final currentUser = FirebaseAuth.instance.currentUser;

          // Reload current user to check email verification status
          await currentUser?.reload();

          // If email is verified, cancel timer and proceed to success
          if (currentUser?.emailVerified ?? false) {
            verificationTimer?.cancel();
            var userEntity = UserEntity(
              name: nameController.text,
              email: emailController.text,
              secondName: secondNameController.text,
              phoneNumber: phoneNumberController.text,
              uId: currentUser!.uid,
              cartList: [],
              points: 0,
            );

            await authRepo.addUserData(userEntity: userEntity);
            await authRepo.getUserData(uId: currentUser.uid);
            await authRepo.saveUserData(userEntity: userEntity);
            emit(SignUpSuccessState(userEntity: userEntity));
            await close();
          }

          // If verification fails after 5 minutes (60 seconds * 5), cancel and show failure
          if (timer.tick > 60 * 5) {
            // 5 minutes
            await currentUser?.delete();
            verificationTimer?.cancel();
            emit(SignUpFailureState(
                message:
                    'انتهت صلاحيةالتحقق من البريد الالكتروني، حاول مرة اخرى!'));
          }
        });
      } else {
        emit(SignUpFailureState(message: failure.message));
      }
    }, (user) async {
      emit(SignUpSuccessState(userEntity: user));
    });
  }

  @override
  Future<void> close() {
    verificationTimer?.cancel(); // Cancel the timer if the cubit is disposed
    return super.close();
  }
}
