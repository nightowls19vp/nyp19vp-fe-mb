import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/utils/validator.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.errorText,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _show = false;
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

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
        errorText: widget.errorText,
        errorMaxLines: 2,
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
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.text),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.text),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
      ),
      validator: (value) => Validators.validate(widget.labelText, value),
    );
  }
}
