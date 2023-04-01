import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/state/nav_bar_state.dart';
import 'package:nyp19vp_mb/utils/routes/routes.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import 'views/login/login_screen.dart';
import 'view_models/login/login_view_model.dart';
import 'view_models/register/register_view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return

        // MaterialApp(
        //     title: 'Flutter Demo',
        //     debugShowCheckedModeBanner: false,
        //     home: Scaffold(
        //       body: LoginScreen(),
        //     ));

        MultiProvider(
            providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => NavigationBarState()),
          ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ],
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.login,
              onGenerateRoute: Routes.generateRoute,
              home: Scaffold(
                  // resizeToAvoidBottomInset: true,
                  body: LoginScreen()),
            ));
  }
}
