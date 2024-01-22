// authentication/data/local_data_source/local_data_source.dart
import 'package:sqflite/sqflite.dart';

import '../../../../core/database.dart';
import '../../domain/entities/user_entity.dart';

abstract class LocalDataSource {
  Future<UserEntity?> signIn(String email, String password);
  Future<void> signUp(UserEntity user);
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final List<Map<String, dynamic>> result = await databaseHelper.database.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return UserEntity(email: result.first['email'], password: result.first['password']);
    }

    return null;
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await databaseHelper.database.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
