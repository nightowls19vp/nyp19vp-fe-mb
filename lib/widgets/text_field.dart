import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/utils/validator.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  final String? date;
  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.errorText,
      required this.controller,
      this.date});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _show = false;
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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

    return TextFormField(
      // initialValue: 'Input your email',\
      // readOnly: (widget.labelText == 'Ngày sinh') ? false : true,
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
                onPressed: () async {
                  if (widget.labelText == 'Mật khẩu' ||
                      widget.labelText == 'Nhập lại mật khẩu') {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                  //  else if (widget.labelText == 'Ngày sinh') {
                  //   await _selectDate(context);
                  //   widget.controller.text =
                  //       DateFormat('yyyy/MM/dd').format(selectedDate);
                  // }
                  else {
                    widget.controller.clear();
                    setState(() {
                      _show = !_show;
                    });
                  }
                },
                icon: (widget.labelText == 'Mật khẩu' ||
                        widget.labelText == 'Nhập lại mật khẩu')
                    ? (_obscureText
                        ? (const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.text,
                          ))
                        : const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.primary,
                          ))
                    : (widget.labelText == 'Ngày sinh')
                        ? const Icon(Icons.calendar_month,
                            color: AppColors.text)
                        : const Icon(Icons.clear, color: AppColors.text),
              )
            : (widget.labelText == 'Ngày sinh')
                ? const Icon(Icons.calendar_month, color: AppColors.text)
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
