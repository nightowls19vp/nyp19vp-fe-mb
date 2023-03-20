import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/utils/routes/routes.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import 'login/views/login_screen.dart';
import 'login/views_models/auth_view_model.dart';

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
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
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
