import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

import 'package:nyp19vp_mb/utils/text_field.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _retypePwdController = TextEditingController();

  late bool show = false;

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, top: 15.0, right: 30.0, bottom: 15.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
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
                              labelText: 'Email',
                              hintText: 'name@example.com',
                              controller: _emailController,
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 30.0),
                            child: CustomTextField(
                              labelText: 'Số điện thoại',
                              hintText: '',
                              controller: _phoneController,
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: CustomTextField(
                              labelText: 'Mật khẩu',
                              hintText: '',
                              controller: _pwdController,
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 20.0),
                            child: CustomTextField(
                              labelText: 'Nhập lại mật khẩu',
                              hintText: '',
                              controller: _retypePwdController,
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 20.0, right: 20.0, bottom: 0),
                          child: SizedBox(
                            child: ElevatedButton(
                              onPressed: () {
                                // Map data = {
                                //   'email':
                                // }
                                // Navigator.pushNamed(context, RoutesName.home);
                              },
                              child: Text(
                                'Đăng ký',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF6750A4),
                                minimumSize: const Size.fromHeight(50), // NEW
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
