import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routs/app_routs.dart';
import '../manager/sign_in_cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Successful Login'),
          ));
          Navigator.pushNamed(
            context,
            Routs.otpVerificationForm,
          );
        } else if (state is SignInFailure) {

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  BlocProvider.of<SignInCubit>(context).signIn(email, password);
                },
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routs.signUpScreen,
                  );
                },
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        );
      },
    );
  }
}
