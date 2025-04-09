import 'package:flutter/material.dart';
import 'package:gym_boost/ui/login/view_model/login_view_model.dart';
import 'package:gym_boost/ui/widgets/glass/glass_button.dart';
import 'package:gym_boost/ui/widgets/glass/glass_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel.login,
          builder: (BuildContext context, _) {
            // if (viewModel.login.isRunning) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: GlassCard(
                    height: 400,
                    width: 300,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: 'email@example.com',
                              ),
                              controller: viewModel.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: viewModel.validateEmail,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              controller: viewModel.passwordController,
                              obscureText: true,
                            ),
                            GlassButton(
                              width: double.infinity,
                              color: Colors.lightBlue,
                              isLoading: viewModel.login.isRunning,
                              onTap: () {
                                if (viewModel.validateForm(context)) {
                                  viewModel.login.execute();
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
