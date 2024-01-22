import 'package:flutter/material.dart';

import 'config/routs/app_routs.dart';
import 'config/thems/app_them.dart';
import 'core/database.dart';
import 'core/utils/app_strings.dart';
import 'injection_contanier.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databaseHelper = DatabaseHelper();
  await databaseHelper.initializeDatabase();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRouts.onGeneratedRoute,
    );
  }
}
