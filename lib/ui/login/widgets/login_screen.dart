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

  LoginData get loginData => LoginData(
        email: emailController.text,
        password: passwordController.text,
      );

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
                            child: Column(
                              children: [
                                TextFormField(),
                                TextFormField(),
                              ],
                            ),
                          ),
                          GlassButton(
                            width: double.infinity,
                            color: Colors.lightBlue,
                            onTap: () {
                              print("Glass button tapped");
                            },
                            child: const Text(
                              "Click Me",
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

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Card(
                //     elevation: 15,
                //     child: Padding(
                //       padding: const EdgeInsets.all(16),
                //       child: Form(
                //         child: Column(
                //           children: [
                //             TextField(
                //               decoration: const InputDecoration(
                //                   labelText: 'Email',
                //                   hintText: 'email@example.com'),
                //               controller: emailController,
                //             ),
                //             TextField(
                //               decoration:
                //                   const InputDecoration(labelText: 'Password'),
                //               controller: passwordController,
                //             ),
                //             ElevatedButton(
                //               onPressed: () =>
                //                   viewModel.login.execute(loginData),
                //               child: const Text('Login'),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
