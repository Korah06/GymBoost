import 'package:flutter/material.dart';
import 'package:gym_boost/routing/paths.dart';
import 'package:gym_boost/routing/routes.dart';
import 'package:gym_boost/ui/login/view_model/login_view_model.dart';
import 'package:gym_boost/ui/login/widgets/login_screen.dart';

import 'data/repositories/auth_repository.dart';

class GymBoost extends StatelessWidget {
  const GymBoost({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository = AuthRepository();

    return MaterialApp(
      title: 'Project Name',
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en'), // English
      //   Locale('es'), // Spanish
      // ],
      // locale: themeState.locale ?? locale,
      // themeMode: themeState.themeMode ?? theme,
      // theme: lightTheme,
      // darkTheme: darkTheme,
      // routes: Routes.routes,
      // initialRoute: login,
      home: LoginScreen(
        // viewModel: LoginViewModel(authRepository: authRepository),
        viewModel: LoginViewModel(),
      ),
    );
  }
}
