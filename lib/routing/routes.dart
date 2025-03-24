import 'package:flutter/material.dart';
import 'package:gym_boost/data/repositories/auth_repository.dart';
import 'package:gym_boost/routing/paths.dart';
import 'package:gym_boost/ui/login/view_model/login_view_model.dart';
import 'package:gym_boost/ui/login/widgets/login_screen.dart';

class Routes {
  final AuthRepository _authRepository = AuthRepository();
  static Map<String, WidgetBuilder> get routes {

    return {
      // login: LoginScreen(viewModel: LoginViewModel(authRepository: _authRepository),),
    };
  }
}
