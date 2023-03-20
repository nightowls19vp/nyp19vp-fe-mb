import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:text_divider/text_divider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../login/views/login_screen.dart';
import '../components/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              backgroundColor: Color.fromARGB(255, 153, 169, 232),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Đăng ký',
                      style: TextStyle(
                          color: Colors.white,
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
                            color: Color.fromRGBO(255, 255, 255, 1),
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        color: Colors.white,
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
                        text: 'Đăng ký với Google',
                        textColor: Color(0xFF49454F),
                        imagePath: 'assets/images/google.png',
                        imageWidth: 33,
                        borderRadius: 7,
                        onPressed: () {},
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, bottom: 10.0),
                    child: SocialLoginButton(
                      buttonType: SocialLoginButtonType.generalLogin,
                      // backgroundColor: Color.fromARGB(255, 24, 119, 242),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      text: 'Đăng ký với Facebook',
                      textColor: Color(0xFF49454F),
                      imagePath: 'assets/images/facebook.png',
                      imageWidth: 36,
                      borderRadius: 7,
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
                              color: Colors.white,
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
                                          color: Colors.white,
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
