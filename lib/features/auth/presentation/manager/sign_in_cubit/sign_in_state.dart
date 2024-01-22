part of 'sign_in_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity user;

  SignInSuccess(this.user);
}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure(this.error);
}


class OtpVerificationLoading extends SignInState {}

class OtpVerificationSuccess extends SignInState {}

class OtpVerificationFailure extends SignInState {
  final String error;

  OtpVerificationFailure(this.error);

  List<Object> get props => [error];
}
