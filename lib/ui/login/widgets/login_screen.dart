import 'dart:typed_data';

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
        child: Column(
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
                        ValueListenableBuilder(
                          valueListenable: viewModel.emailLabel,
                          builder: (context, value, child) => TextFormField(
                            decoration: InputDecoration(
                              labelText: value,
                              hintText: 'email@example.com',
                            ),
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            // validator: viewModel.validateEmail,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          controller: viewModel.passwordController,
                          obscureText: true,
                        ),
                        ValueListenableBuilder(
                          valueListenable: viewModel.isLoading,
                          builder:(context, value, child) => GlassButton(
                            width: double.infinity,
                            color: Colors.lightBlue,
                            isLoading: value,
                            onTap: () {
                              // if (viewModel.validateForm(context)) {
                              //   viewModel.login.execute();
                              // }
                              viewModel.changeLabel();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
        ),
      ),
    );
  }
}
