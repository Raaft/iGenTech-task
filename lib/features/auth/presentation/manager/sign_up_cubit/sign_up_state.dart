// authentication/presentation/bloc/sign_up_state.dart
part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity user;

  SignUpSuccess(this.user);
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}
