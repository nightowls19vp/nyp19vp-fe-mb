import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'login/components/login_form_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginFormWidget(),
    );
  }
}
