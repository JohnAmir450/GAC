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
        name: nameController.text);
    result.fold((failure) {
      emit(SignUpFailureState(message: failure.message));
    }, (user) {
      emit(SignUpSuccessState(userEntity: user));
    });
  }
}
