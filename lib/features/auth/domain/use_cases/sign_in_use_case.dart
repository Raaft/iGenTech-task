// authentication/domain/use_case/sign_in_use_case.dart
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

abstract class SignInUseCase {
  Future<UserEntity?> signIn(String email, String password);
  Future<bool> verifyOtp(String otp);

}


class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCaseImpl({required this.authRepository});

  @override
  Future<UserEntity?> signIn(String email, String password) {
    return authRepository.signIn(email, password);
  }

  @override
  Future<bool> verifyOtp(String otp) async {

    return true;
  }
}
