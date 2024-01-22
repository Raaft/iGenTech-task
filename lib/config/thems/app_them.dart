import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme(){
  return ThemeData(
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,

  );
}