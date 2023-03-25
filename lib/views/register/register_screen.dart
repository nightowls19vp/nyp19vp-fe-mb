import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:text_divider/text_divider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:nyp19vp_mb/res/colors.dart';

import '../login/login_screen.dart';
import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Scaffold(
            backgroundColor: AppColors.background,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Đăng ký',
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      child: RegisterForm(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                      child: SizedBox(
                        // width: 350,
                        // height: 20,
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
                          backgroundColor: Color(0xFFFFFFFF),
                          text: 'Đăng ký với Google',
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
                        text: 'Đăng ký với Facebook',
                        textColor: AppColors.text,
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
                              'Đã có tài khoản?',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 20.0),
                            //   child: Text(
                            //     'Đăng ký',
                            //     style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginScreen();
                                    }));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Đăng nhập',
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
          )),
    );
  }
}
