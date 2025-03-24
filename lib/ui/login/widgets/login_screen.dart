import 'package:flutter/material.dart';
import 'package:gym_boost/ui/login/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'email@example.com'),
                              controller: emailController,
                            ),
                            TextField(
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              controller: passwordController,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                viewModel.login(
                                  emailController.text,
                                  passwordController.text,
                                );
                              },
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
