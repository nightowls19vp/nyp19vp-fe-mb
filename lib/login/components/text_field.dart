import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  CustomTextField({super.key, required this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _show = false;
  bool _obscureText = true;
  final TextEditingController _controller = new TextEditingController();

  MultiValidator validatorResult(String label) {
    var validator;
    if (label == 'Email') {
      validator = MultiValidator([
        RequiredValidator(errorText: "Please enter your email"),
        EmailValidator(errorText: "Enter valid email")
      ]);
    } else if (label == 'Password') {
      validator = MultiValidator([
        RequiredValidator(errorText: "Please enter your password"),
        MinLengthValidator(6,
            errorText: "Password should be at least 6 characters"),
        MaxLengthValidator(15,
            errorText: "Password should not be greater than 15 characters"),
      ]);
    }

    return validator;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: 'Input your email',\
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
      controller: _controller,
      validator: validatorResult(widget.label),
      obscureText: widget.label == 'Password' ? _obscureText : !_obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Color(0xFF49454F),
        ),
        hintText: widget.label == 'Email' ? 'email@xyz.com' : '',
        suffixIcon: _show
            ? IconButton(
                onPressed: () {
                  if (widget.label == 'Password') {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  } else {
                    _controller.clear();
                  }
                },
                icon: widget.label == 'Password'
                    ? (_obscureText
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility))
                    : Icon(Icons.clear),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF49454F)),
        ),
      ),
    );
  }
}
