import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/constants/text_field_type.dart';
import 'package:nyp19vp_mb/models/validate_response_model.dart';
import 'package:nyp19vp_mb/state/current_user_state.dart';
import 'package:nyp19vp_mb/utils/routes/routes_name.dart';

import 'package:nyp19vp_mb/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../../models/auth_response_model.dart';
import 'forgot_pwd_page.dart';
import '../../view_models/login/login_view_model.dart';
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
  late bool validatePwd = false;

  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    final curUser = Provider.of<CurUserState>(context);

    return Center(
        child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 30.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          type: TextFieldType.username,
                          labelText: 'Tên đăng nhập',
                          controller: _emailController,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: CustomTextField(
                            type: TextFieldType.passwordLogin,
                            labelText: 'Mật khẩu',
                            controller: _pwdController,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.forgetPwd);
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
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: InkWell(
                            onTap: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              // Navigator.pushNamed(context, RoutesName.home);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RoutesName.home,
                                (route) => false,
                              );
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Map data = {
                                  'username': _emailController.text.toString(),
                                  'password': _pwdController.text.toString(),
                                };

                                // AuthResponseModel response =
                                //     await loginViewModel.loginApi(
                                //         data, context);
                                // print("Access token: ${response.accessToken}");
                                // curUser.accessToken = response.accessToken;
                                // String token = '${curUser.accessToken}';
                                // if (token.isNotEmpty) {
                                //   dynamic validateRes =
                                //       await loginViewModel.validate(token);
                                //   print(validateRes);
                                // }
                              }
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 50,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 20.0),
                      //   child: Column(
                      //     children: [
                      //       SizedBox(
                      //         child: ElevatedButton(
                      //           onPressed: () async {
                      //             _errorMsg = '';
                      //             FocusManager.instance.primaryFocus?.unfocus();
                      //             // Navigator.pushNamed(context, RoutesName.home);
                      //             if (_formKey.currentState!.validate()) {
                      //               _formKey.currentState!.save();
                      //               Map data = {
                      //                 'username':
                      //                     _emailController.text.toString(),
                      //                 'password':
                      //                     _pwdController.text.toString(),
                      //               };

                      //               LoginResponseModel response =
                      //                   await loginViewModel.loginApi(
                      //                       data, context);

                      //               if (response.statusCode == 401) {
                      //                 setState(() {
                      //                   // loginViewModel.setLoading(false);
                      //                   validatePwd = true;
                      //                   _errorMsg = "Mật khẩu không khớp";
                      //                 });
                      //               } else if (response.statusCode == 404) {
                      //                 setState(() {
                      //                   // loginViewModel.setLoading(false);
                      //                   validatePwd = true;
                      //                   _errorMsg = "Tài khoản không tồn tại";
                      //                 });
                      //               } else {
                      //                 setState(() {
                      //                   Navigator.pushNamed(
                      //                       context, RoutesName.home);
                      //                   validatePwd = false;
                      //                   _errorMsg = "";
                      //                 });
                      //               }
                      //             }
                      //           },
                      //           style: ElevatedButton.styleFrom(
                      //             primary: AppColors.primary,
                      //             minimumSize: const Size.fromHeight(50),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius:
                      //                   BorderRadius.circular(10), // <-- Radius
                      //             ),
                      //           ),
                      //           child: Text(
                      //             'Đăng nhập',
                      //             style: TextStyle(
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ]),
              ),
            )),
      ],
    ));
  }
}
