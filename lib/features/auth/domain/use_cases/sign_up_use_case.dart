import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

abstract class SignUpUseCase {
  Future<void> signUp(UserEntity user);
}




class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCaseImpl({required this.authRepository});

  @override
  Future<void> signUp(UserEntity user) {
    return authRepository.signUp(user);
  }
}
