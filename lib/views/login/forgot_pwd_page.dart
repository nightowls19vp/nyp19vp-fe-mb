import 'package:flutter/material.dart';

import '../../constants/text_field_type.dart';
import '../../res/colors.dart';
import '../../widgets/text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();
  bool _showPwdField = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Đặt lại mật khẩu',
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        backgroundColor: AppColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: SizedBox(
                child: CustomTextField(
                  type: TextFieldType.username,
                  labelText: 'Tên đăng nhập',
                  hintText: '',
                  controller: _usernameController,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showPwdField = !_showPwdField;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primary,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(
                        'Đặt lại mật khẩu',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
