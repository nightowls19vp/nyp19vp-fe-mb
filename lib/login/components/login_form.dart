import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

import 'package:nyp19vp_mb/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../views/forgot_pwd_page.dart';
import '../views_models/auth_view_model.dart';
import 'package:nyp19vp_mb/res/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  late bool show = false;

  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, top: 15.0, right: 30.0, bottom: 15.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 30.0),
                            child: CustomTextField(
                              labelText: 'Tên đăng nhập',
                              hintText: '',
                              controller: _emailController,
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: SizedBox(
                              child: CustomTextField(
                                labelText: 'Mật khẩu',
                                hintText: '',
                                controller: _pwdController,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgotPasswordPage();
                                }));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Quên mật khẩu?',
                                      style: TextStyle(
                                        color: AppColors.text,
                                        fontSize: 14,
                                      )),
                                ],
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 20.0, right: 20.0, bottom: 0),
                          child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                Map data = {
                                  'username': _emailController.text.toString(),
                                  'password': _pwdController.text.toString(),
                                };

                                authViewModel.loginApi(data, context);
                                // Navigator.pushNamed(context, RoutesName.home);
                              },
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primary,
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              )),
        ),
      ],
    ));
  }
}
