// authentication/presentation/bloc/sign_up_cubit.dart
import 'package:bloc/bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());

  Future<void> signUp(String email, String password) async {
    emit(SignUpLoading());

    if (email.isEmpty) {
      emit(SignUpFailure('Please enter your Email'));
    } else if (password.isEmpty) {
      emit(SignUpFailure('Please enter your Password'));
    } else {
      try {
        final user = UserEntity(email: email, password: password);
        await signUpUseCase.signUp(user);

        emit(SignUpSuccess(user));
      } catch (e) {
        emit(SignUpFailure('Error during sign-up'));
      }
    }
  }
}
