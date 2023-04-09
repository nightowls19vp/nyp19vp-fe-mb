import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/constants/text_field_type.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/widgets/text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _phoneController = TextEditingController();
    final _dobController = TextEditingController();

    _nameController.text = 'Hồ Ngọc Minh Châu';
    _emailController.text = 'abc@xyz.com';
    _phoneController.text = '0931564102';
    _dobController.text = '19/11/2001';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        titleSpacing: 0,
        title: Text(
          'Chỉnh sửa thông tin cá nhân',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.bgPrimary,
          ),
        ),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          type: TextFieldType.email,
                          labelText: 'Họ tên',
                          controller: _nameController,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: CustomTextField(
                          type: TextFieldType.email,
                          labelText: 'Email',
                          controller: _emailController,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: CustomTextField(
                        type: TextFieldType.phone,
                        labelText: 'Số điện thoại',
                        controller: _phoneController,
                      ),
                    ),
                    CustomTextField(
                      type: TextFieldType.dob,
                      labelText: 'Ngày sinh',
                      controller: _dobController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.orange,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                    ),
                    child: Text(
                      'Lưu',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
