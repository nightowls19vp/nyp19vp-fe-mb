import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/state/current_user_state.dart';
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
          ChangeNotifierProvider(create: (_) => CurUserState()),
          ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ],
            child: MaterialApp(
              // theme: ThemeData(
              //   useMaterial3: true,
              //   colorScheme: ColorScheme.light(
              //     brightness: Brightness.light,
              //     primary: AppColors.orange,
              //     onPrimary: AppColors.bgPrimary,
              //     secondary: Colors.black,
              //     onSecondary: Colors.black,
              //     error: AppColors.error,
              //     onError: AppColors.error,
              //     background: Colors.white,
              //     onBackground: AppColors.bgSecondary,
              //     surface: AppColors.orange,
              //     onSurface: AppColors.text,
              //   ),
              // ),
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
