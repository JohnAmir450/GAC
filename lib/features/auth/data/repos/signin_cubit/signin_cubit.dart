import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit(this.authRepo) : super(SignInInitial());
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
Icon suffixIcon = const Icon(Icons.visibility);
  bool isObscured = true;

  void changePasswordVisibility() {
    isObscured = !isObscured;
    suffixIcon = isObscured
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
        emit(SingInChangePasswordVisibility());
  }
  Future<void> signIn() async {
    emit(SignInLoadingState());
    var result = await authRepo
        .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    result.fold((failure) {
      emit(SignInFailureState(message: failure.message));
    }, (user) {
      emit(SignInSuccessState(userEntity: user));
    });
  }
  Future<void> signInWithGoogle() async {
    emit(SignInLoadingState());
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(SignInFailureState(message: failure.message));
    }, (user) {
      emit(SignInSuccessState(userEntity: user));
    });
  }
}