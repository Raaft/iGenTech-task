import 'package:bloc/bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/sign_in_use_case.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit({required this.signInUseCase}) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    if (email.isEmpty) {
      emit(SignInFailure('Please enter your Email'));
    } else if (password.isEmpty) {
      emit(SignInFailure('Please enter your Password'));
    } else {
      try {
        final user = await signInUseCase.signIn(email, password);

        if (user != null) {
          emit(SignInSuccess(user));
        } else {
          emit(SignInFailure('Invalid credentials'));
        }
      } catch (e) {
        emit(SignInFailure('Error during sign-in'));
      }
    }
  }

  Future<void> verifyOtp(String otp,context) async {
    emit(OtpVerificationLoading());
    if(otp.isEmpty||otp.length<6){
      emit(OtpVerificationFailure('Invalid OTP'));
    }else{ try {
      final isOtpValid = await signInUseCase.verifyOtp(otp);

      if (isOtpValid) {
        emit(OtpVerificationSuccess());

      } else {
        emit(OtpVerificationFailure('Invalid OTP'));
      }
    } catch (e) {
      emit(OtpVerificationFailure('Error during OTP verification: $e'));
    }}


  }
}
