part of 'signin_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final UserEntity userEntity;

  SignInSuccessState({required this.userEntity});
}

final class SignInFailureState extends SignInState {
  final String message;

  SignInFailureState({required this.message});
}
final class SingInChangePasswordVisibility extends SignInState {}