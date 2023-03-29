import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyp19vp_mb/models/register_request_model.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

import 'package:nyp19vp_mb/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../models/login_response_model.dart';
import '../../res/colors.dart';
import '../../view_models/register/register_view_model.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  late bool show = false;

  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<RegisterViewModel>(context);

    DateTime selectedDate = DateTime.now();

    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 30.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          labelText: 'Tên đăng nhập',
                          hintText: '',
                          controller: _usernameController,
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          labelText: 'Mật khẩu',
                          hintText: '',
                          controller: _pwdController,
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          labelText: 'Họ tên',
                          hintText: '',
                          controller: _nameController,
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          labelText: 'Email',
                          hintText: '',
                          controller: _emailController,
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          labelText: 'Số điện thoại',
                          hintText: '',
                          controller: _phoneController,
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 35.0),
                        child: CustomTextField(
                          labelText: 'Ngày sinh',
                          hintText: '',
                          controller: _dobController,
                          date: '',
                        )),
                    InkWell(
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        await _selectDate(context);
                        _dobController.text =
                            DateFormat('yyyy/MM/dd').format(selectedDate);
                        if (_formKey.currentState!.validate()) {
                          Map data = {
                            'username': _usernameController.text,
                            'password': _pwdController.text,
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'phone': _phoneController.text,
                            'dob': selectedDate.toIso8601String(),
                          };

                          RegisterRequestModel request = RegisterRequestModel(
                            username: data["username"],
                            password: data["password"],
                            name: data["name"],
                            phone: data["phone"],
                            email: data["email"],
                            dob: data["dob"],
                          );

                          print(data);

                          var json = jsonEncode(request.toJson());

                          print(json);
                          LoginResponseModel response = await registerViewModel
                              .registerApi(data, context);

                          print('Response: $response');
                          // Navigator.pushNamed(context, RoutesName.home);
                        }
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Đăng ký',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   child: ElevatedButton(
                    //     onPressed: () async {
                    //       FocusManager.instance.primaryFocus?.unfocus();
                    //       await _selectDate(context);
                    //       _dobController.text =
                    //           DateFormat('yyyy/MM/dd').format(selectedDate);
                    //       if (_formKey.currentState!.validate()) {
                    //         Map data = {
                    //           'username': _usernameController.text,
                    //           'password': _pwdController.text,
                    //           'name': _nameController.text,
                    //           'email': _emailController.text,
                    //           'phone': _phoneController.text,
                    //           'dob': selectedDate.toIso8601String(),
                    //         };

                    //         RegisterRequestModel request = RegisterRequestModel(
                    //           username: data["username"],
                    //           password: data["password"],
                    //           name: data["name"],
                    //           phone: data["phone"],
                    //           email: data["email"],
                    //           dob: data["dob"],
                    //         );

                    //         print(data);

                    //         var json = jsonEncode(request.toJson());

                    //         print(json);
                    //         LoginResponseModel response =
                    //             await registerViewModel.registerApi(
                    //                 data, context);

                    //         print('Response: $response');
                    //         // Navigator.pushNamed(context, RoutesName.home);
                    //       }
                    //     },
                    //     child: Text(
                    //       'Đăng ký',
                    //       style: TextStyle(
                    //           fontSize: 18, fontWeight: FontWeight.bold),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: AppColors.primary,
                    //       minimumSize: const Size.fromHeight(50),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius:
                    //             BorderRadius.circular(10), // <-- Radius
                    //       ), // NEW
                    //     ),
                    //   ),
                    // ),
                  ]),
            ),
          ),
        ),
      ],
    ));
  }
}
