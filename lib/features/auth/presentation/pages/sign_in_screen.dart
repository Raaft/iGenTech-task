import 'package:flutter/material.dart';

import '../widgets/signin_form_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SignInForm(),
    );
  }
}

