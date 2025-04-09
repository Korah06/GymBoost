import 'package:flutter/material.dart';
import 'package:gym_boost/data/model/login_data.dart';
import 'package:gym_boost/ui/login/view_model/login_view_model.dart';
import 'package:gym_boost/ui/widgets/glass/glass_button.dart';
import 'package:gym_boost/ui/widgets/glass/glass_card.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginData get loginData => LoginData(
        email: emailController.text,
        password: passwordController.text,
      );

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel.login,
          builder: (BuildContext context, _) {
            if (viewModel.login.isRunning) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'email@example.com'),
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    return emailValidation(value);
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  controller: passwordController,
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                          GlassButton(
                            width: double.infinity,
                            color: Colors.lightBlue,
                            onTap: () {
                              viewModel.login.execute(loginData);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
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
