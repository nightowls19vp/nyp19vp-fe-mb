import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/utils/validator.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _show = false;
  bool _obscureText = true;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: 'Input your email',\
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            _show = true;
          });
        } else {
          setState(() {
            _show = false;
          });
        }
      },
      controller: widget.controller,
      obscureText: (widget.labelText == 'Mật khẩu' ||
              widget.labelText == 'Nhập lại mật khẩu')
          ? _obscureText
          : !_obscureText,
      cursorColor: AppColors.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: AppColors.text,
          fontSize: 18,
        ),
        hintText: widget.hintText,
        suffixIcon: _show
            ? IconButton(
                onPressed: () {
                  if (widget.labelText == 'Mật khẩu' ||
                      widget.labelText == 'Nhập lại mật khẩu') {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  } else {
                    widget.controller.clear();
                    setState(() {
                      _show = !_show;
                    });
                  }
                },
                icon: (widget.labelText == 'Mật khẩu' ||
                        widget.labelText == 'Nhập lại mật khẩu')
                    ? (_obscureText
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.text,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.primary,
                          ))
                    : const Icon(Icons.clear, color: AppColors.text),
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.text,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.text),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
      ),
      validator: (value) => Validators.validate(widget.labelText, value),
    );
  }
}

class Validators {
  static validate(String labelText, String? value) {
    String? result;
    if (labelText == 'Tên đăng nhập') {
      result = validateUsername(value);
    }

    return result;
  }

  static String? validateUsername(String? value) {
    // String pattern = r'(^[a-zA-Z ]*$)';
    String pattern =
        r'(^(?=.{8,255}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$)';

    String character = r'(^[a-zA-Z0-9._]+(?<![_.])$)';
    String length = r'(^?=.{8,255}$)';

    RegExp characterRegex = RegExp(r'^[a-zA-Z0-9_.]+$');
    RegExp lengthRegex = RegExp(r'^.{8,255}$');
    RegExp startEndRegrex = RegExp(r'^[a-zA-Z0-9]+([_.][a-zA-Z0-9]+)*$');
    RegExp underscoreDotRegrex =
        RegExp(r'^[a-zA-Z0-9]+([_.](?![_.])|[a-zA-Z0-9])*$');
    RegExp doubleCharRegrex =
        RegExp(r'^[a-zA-Z0-9]+([_.](?![_.])+[a-zA-Z0-9]+)*$');

    if (value?.length == 0) {
      return "Vui lòng nhập tên đăng nhập";
    } else if (!lengthRegex.hasMatch(value!)) {
      return "Tên đăng nhập phải có ít nhất 8 kí tự";
    } else if (!characterRegex.hasMatch(value)) {
      return "Tên đăng nhập chỉ chứa các ký tự chữ và số, dấu gạch \ndưới và dấu chấm";
    } else {
      if (!startEndRegrex.hasMatch(value)) {
        if (!underscoreDotRegrex.hasMatch(value)) {
          if (!doubleCharRegrex.hasMatch(value)) {
            return "Dấu gạch dưới hoặc dấu chấm không thể được sử \ndụng nhiều lần liên tiếp";
          } else {
            return "Dấu gạch dưới và dấu chấm không được ở cạnh nhau";
          }
        } else {
          return "Tên đăng nhập không thể bắt đầu hoặc kết thúc bằng \ndấu gạch dưới hoặc dấu chấm";
        }
      }
    }
    return '';
  }
}
//login: username, pwd
//register: username, pwd, name, dob, phone, email
// username: ^(?=.{8,255}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$
// password: ^(?=[.\S]*[A-Z][.\S]*)(?=[.\S]*[0-9][.\S]*)(?=[.\S]*[a-z][.\S]*)[.\S]{8,255}$
// {
//   "username": "username_example",
//   "password": "P@s5__.word",
//   "name": "night owl",
//   "dob": "2023-03-22T14:53:27.103Z",
//   "phone": "0987654321",
//   "email": "example@ex.com"
// }
