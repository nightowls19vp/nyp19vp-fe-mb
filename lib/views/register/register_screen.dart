import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:text_divider/text_divider.dart';
import 'package:nyp19vp_mb/res/colors.dart';

import '../../utils/routes/routes_name.dart';
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
            backgroundColor: AppColors.bgPrimary,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Đăng ký',
                        style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      child: RegisterForm(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 15.0),
                      child: SizedBox(
                        // width: 350,
                        // height: 20,
                        child: TextDivider.horizontal(
                          text: const Text(
                            'Hoặc',
                            style: TextStyle(
                              color: AppColors.orange,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          color: AppColors.orange,
                          thickness: 1.0,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                          onTap: () {
                            print('Google');
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: screenWidth * 0.85,
                            height: 50,
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 227, 227, 227))),
                              child: Center(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Image.asset('assets/images/google.png',
                                        height:
                                            24), // <-- Use 'Image.asset(...)' here
                                    SizedBox(width: 12),
                                    Text(
                                      'Đăng nhập với Google',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                          onTap: () {
                            print('Facebook');
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: screenWidth * 0.85,
                            height: 50,
                            child: Ink(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 227, 227, 227))),
                              child: Center(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Image.asset('assets/images/facebook.png',
                                        height:
                                            24), // <-- Use 'Image.asset(...)' here
                                    SizedBox(width: 12),
                                    Text(
                                      'Đăng nhập với Facebook',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 30.0, right: 30.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Đã có tài khoản?',
                              style: TextStyle(
                                color: AppColors.orange,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.login);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Đăng nhập',
                                        style: TextStyle(
                                            color: AppColors.orange,
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
