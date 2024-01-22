// authentication/presentation/pages/otp_verification_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routs/app_routs.dart';
import '../manager/sign_in_cubit/sign_in_cubit.dart';

class OtpVerificationForm extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpVerificationForm({super.key});




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is OtpVerificationSuccess) {

          Navigator.pushReplacementNamed(
            context,
            Routs.qRCodeScannerScreen,
          );

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter the 6-digit OTP sent to your Email',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,

                  decoration: InputDecoration(

                    labelText: 'OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    errorText: state is OtpVerificationFailure ? state.error : null,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final otp = otpController.text;
                    BlocProvider.of<SignInCubit>(context).verifyOtp(otp,context);
                  },
                  child: state is OtpVerificationLoading
                      ? const CircularProgressIndicator()
                      : const Text('Verify OTP'),
                ),
                const SizedBox(height: 8),
                if (state is OtpVerificationFailure)
                  const Text(
                    'Note: You can use a static OTP like "123456" for testing.',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
