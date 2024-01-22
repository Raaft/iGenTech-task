import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/local_data_source.dart';


class AuthRepositoryImpl implements AuthRepository {
  final LocalDataSource localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<UserEntity?> signIn(String email, String password) {
    return localDataSource.signIn(email, password);
  }

  @override
  Future<void> signUp(UserEntity user) {
    return localDataSource.signUp(user);
  }
}
