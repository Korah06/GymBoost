import 'package:flutter/cupertino.dart';
import 'package:gym_boost/data/model/login_data.dart';
import 'package:gym_boost/data/repositories/auth_repository.dart';
import 'package:gym_boost/utils/Result.dart';
import 'package:gym_boost/utils/command.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    login = Command1(_login);
  }

  final AuthRepository _authRepository;

  String? _email;
  String? _password;

  late Command1<void,LoginData> login;

  Future<Result> _login(LoginData data) async {
    try {
      _email = data.email;
      _password = data.password;
      await _authRepository.login(email: _email!, password: _password!);
      await Future.delayed(const Duration(seconds: 5));
      return const Result.ok(true);
    } on Exception catch (_, e) {
      return Result.error(e as Exception);
    } finally {
      notifyListeners();
    }
  }

}
