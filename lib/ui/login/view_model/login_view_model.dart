import 'package:flutter/material.dart';
import 'package:gym_boost/data/model/login_data.dart';
import 'package:gym_boost/data/repositories/auth_repository.dart';
import 'package:gym_boost/utils/Result.dart';
import 'package:gym_boost/utils/command.dart';

class LoginViewModel{
  final ValueNotifier<String> emailLabel = ValueNotifier<String>('Email');
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeLabel() {
    isLoading.value = !isLoading.value;
    emailLabel.value = "Hello there";
  }
}

// class LoginViewModel extends ChangeNotifier {
//   LoginViewModel({required AuthRepository authRepository})
//       : _authRepository = authRepository {
//     login = Command0(_login);
//   }
//
//   final AuthRepository _authRepository;
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   late Command0<void> login;
//
//   String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email';
//     }
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//       return 'Enter a valid email';
//     }
//     return null;
//   }
//
//   bool validateForm(BuildContext context) {
//     if (formKey.currentState?.validate() ?? false) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Processing Data')),
//       );
//       return true;
//     }
//     return false;
//   }
//
//   LoginData get loginData => LoginData(
//     email: emailController.text.trim(),
//     password: passwordController.text,
//   );
//
//   Future<Result> _login() async {
//     try {
//       await _authRepository.login(
//         email: loginData.email,
//         password: loginData.password,
//       );
//       // Simulate a delay for demonstration purposes
//       await Future.delayed(const Duration(seconds: 2));
//       return const Result.ok(true);
//     } on Exception catch (e) {
//       return Result.error(e);
//     } finally {
//       notifyListeners();
//     }
//   }
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }
