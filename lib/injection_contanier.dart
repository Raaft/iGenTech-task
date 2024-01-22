


import 'package:get_it/get_it.dart';

import 'core/database.dart';
import 'features/auth/data/data_sources/local_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/use_cases/sign_in_use_case.dart';
import 'features/auth/domain/use_cases/sign_up_use_case.dart';
import 'features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Database
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  await sl<DatabaseHelper>().initializeDatabase();

  // Local Data Source
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(databaseHelper: sl<DatabaseHelper>()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(localDataSource: sl<LocalDataSource>()));

  // Use Cases
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCaseImpl(authRepository: sl<AuthRepository>()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCaseImpl(authRepository: sl<AuthRepository>()));

  // Cubits
  sl.registerFactory(() => SignInCubit(signInUseCase: sl<SignInUseCase>()));
  sl.registerFactory(() => SignUpCubit(signUpUseCase: sl<SignUpUseCase>()));
}
