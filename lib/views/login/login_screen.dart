import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nyp19vp_mb/view_models/login/login_view_model.dart';
import 'package:provider/provider.dart';

import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:text_divider/text_divider.dart';

import '../register/register_screen.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: Scaffold(
              backgroundColor: AppColors.background,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Đăng nhập',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    child: LoginForm(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10.0),
                    child: SizedBox(
                      child: TextDivider.horizontal(
                        text: const Text(
                          'Hoặc',
                          style: TextStyle(
                            color: AppColors.primary,
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        color: AppColors.primary,
                        thickness: 1.0,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, bottom: 10.0),
                      child: SocialLoginButton(
                        buttonType: SocialLoginButtonType.generalLogin,
                        // backgroundColor: Color.fromARGB(255, 24, 119, 242),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        text: 'Đăng nhập với Google',
                        textColor: AppColors.text,
                        imagePath: 'assets/images/google.png',
                        imageWidth: 33,
                        borderRadius: 10,
                        onPressed: () {},
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, bottom: 10.0),
                    child: SocialLoginButton(
                      buttonType: SocialLoginButtonType.generalLogin,
                      // backgroundColor: Color.fromARGB(255, 24, 119, 242),
                      backgroundColor: Color(0xFFFFFFFF),
                      text: 'Đăng nhập với Facebook',
                      textColor: AppColors.text,
                      height: 50,
                      imagePath: 'assets/images/facebook.png',
                      imageWidth: 36,
                      borderRadius: 10,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Chưa có tài khoản?',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RegisterScreen();
                                  }));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Đăng ký',
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
