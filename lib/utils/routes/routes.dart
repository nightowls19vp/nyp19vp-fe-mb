import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
import 'package:nyp19vp_mb/views/home/home_screen.dart';
import 'package:nyp19vp_mb/views/login/forgot_pwd_page.dart';
import 'package:nyp19vp_mb/views/login/login_screen.dart';
import 'package:nyp19vp_mb/views/register/register_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.forgetPwd:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgotPasswordScreen());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
