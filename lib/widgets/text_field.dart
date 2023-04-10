import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nyp19vp_mb/constants/text_field_type.dart';
import 'package:nyp19vp_mb/res/colors.dart';
import 'package:nyp19vp_mb/utils/validator.dart';

class CustomTextField extends StatefulWidget {
  final TextFieldType type;
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.type,
    required this.labelText,
    this.hintText,
    required this.controller,
  });

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
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                useMaterial3: true,
                colorScheme: ColorScheme.light(
                  primary: AppColors.orange, // header background color
                  onPrimary: AppColors.bgPrimary, // header text color
                  onSurface: AppColors.text, // body text color
                ),
              ),
              child: child!);
        },
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return TextFormField(
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
      readOnly: (widget.type == TextFieldType.dob) ? true : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: (widget.type == TextFieldType.passwordLogin ||
              widget.type == TextFieldType.passwordRegister ||
              widget.type == TextFieldType.retypePassword)
          ? _obscureText
          : !_obscureText,
      cursorColor: AppColors.text,
      keyboardType: (widget.type == TextFieldType.phone)
          ? TextInputType.numberWithOptions()
          : TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: AppColors.text,
          fontSize: 18,
        ),
        hintText: widget.hintText,
        errorMaxLines: 2,
        suffixIcon: _show
            ? IconButton(
                onPressed: () async {
                  if (widget.type == TextFieldType.passwordLogin ||
                      widget.type == TextFieldType.passwordRegister ||
                      widget.type == TextFieldType.retypePassword) {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  } else {
                    if (widget.type != TextFieldType.dob) {
                      widget.controller.clear();
                    } else if (widget.type == TextFieldType.dob) {
                      await _selectDate(context);
                      widget.controller.text =
                          DateFormat('yyyy/MM/dd').format(selectedDate);
                    }
                  }
                },
                icon: (widget.type == TextFieldType.passwordLogin ||
                        widget.type == TextFieldType.passwordRegister ||
                        widget.type == TextFieldType.retypePassword)
                    ? (_obscureText
                        ? (const Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.text,
                          ))
                        : const Icon(
                            Icons.visibility_outlined,
                            color: AppColors.orange,
                          ))
                    : (widget.type == TextFieldType.dob)
                        ? const Icon(Icons.calendar_month,
                            color: AppColors.text)
                        : const Icon(Icons.clear, color: AppColors.text),
              )
            : (widget.type == TextFieldType.dob)
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
      validator: (value) => Validators.validate(widget.type, value),
    );
  }
}
