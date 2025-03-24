import 'package:flutter/cupertino.dart';
import 'package:gym_boost/data/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier{

  LoginViewModel({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  String? _email;
  String? _password;

  Future<void> login(String email, String password) async {
    try {
      _email = email;
      _password = password;
      await _authRepository.login(email: _email!, password: _password!);
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

}