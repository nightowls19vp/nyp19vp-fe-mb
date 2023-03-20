import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
import 'package:nyp19vp_mb/login/views/login_screen.dart';
import 'package:nyp19vp_mb/register/views/register_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());

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
