import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
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

  // final TextEditingController _controller = new TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  String getName(String label) {
    late String result;

    switch (label) {
      case 'Email':
        result = 'email';
        break;
      case 'Số điện thoại':
        result = 'phone';
        break;
      case 'Mật khẩu':
        result = 'pwd';
        break;
      case 'Nhập lại mật khẩu':
        result = 'retypePwd';
        break;
      default:
        result = '';
        break;
    }

    return result;
  }

  String getKey(String label) {
    String result = '_';
    String endOfRes = 'FieldKey';

    switch (label) {
      case 'Email':
        result = '${result}email$endOfRes';
        break;
      case 'Số điện thoại':
        result = '${result}phone$endOfRes';
        break;
      case 'Mật khẩu':
        result = '${result}pwd$endOfRes';
        break;
      case 'Nhập lại mật khẩu':
        result = '${result}retypePwd$endOfRes';
        break;
      default:
        result = '';
        break;
    }
    return result;
  }

  String getHintText(String label) {
    late String result;

    switch (label) {
      case 'Email':
        result = 'name@example.com';
        break;
      default:
        result = '';
        break;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // initialValue: 'Input your email',\
        autovalidateMode: AutovalidateMode.always,
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
        cursorColor: const Color.fromARGB(255, 73, 69, 79),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF49454F),
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
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xFF49454F),
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: Color(0xFF6750A4),
                            ))
                      : Icon(Icons.clear, color: Color(0xFF49454F)),
                )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF49454F),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF49454F)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFB3261E),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFB3261E),
            ),
          ),
        ));
  }
}
