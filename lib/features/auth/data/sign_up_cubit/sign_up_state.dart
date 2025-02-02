part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoadingState extends SignUpState {}
final class SignUpSuccessState extends SignUpState {
  final UserEntity userEntity;

  SignUpSuccessState({required this.userEntity});
}
final class SignUpFailureState extends SignUpState {
  final String message;

  SignUpFailureState({required this.message});
}
final class SingUpChangePasswordVisibility extends SignUpState {}

final class SignUpVerificationSentState extends SignUpState {}