import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {

        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Successful Registration'),
          ));
          Navigator.pop(
            context,
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
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
                  BlocProvider.of<SignUpCubit>(context).signUp(email, password);
                },
                child: const Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,

                  );
                },
                child: const Text("You Already have an account? Login"),
              ),
            ],
          ),
        );
      },
    );
  }
}
