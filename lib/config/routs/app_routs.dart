import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import '../../features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import '../../features/auth/presentation/pages/otp_verification_screen.dart';
import '../../features/auth/presentation/pages/sign_in_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/qr_code/presentation/pages/qr_code_scanner_screen.dart';
import '../../injection_contanier.dart' as di;

class Routs {
  static const String initialRoute = "/";
  static const String signUpScreen = "signUpScreen";
  static const String otpVerificationForm = "otpVerificationForm";
  static const String qRCodeScannerScreen = "qRCodeScannerScreen";
}

class AppRouts {
  static Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routs.initialRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => di.sl<SignInCubit>(),
                  child: const SignInScreen(),
                )));
      case Routs.signUpScreen:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
              create: (context) => di.sl<SignUpCubit>(),
                  child:   const SignUpScreen(),
                )));
        case Routs.otpVerificationForm:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
              create: (context) => di.sl<SignInCubit>(),
                  child:    OtpVerificationForm(),
                )));
        case Routs.qRCodeScannerScreen:
        return MaterialPageRoute(
            builder: ((context) => const QRCodeScannerScreen()));

      default:
        return null;
    }
  }
}
