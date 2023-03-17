import 'package:flutter/material.dart';

import '../../components/text_field.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  // late final TextEditingController emailController = TextEditingController()
  //   ..addListener(() {
  //     if (emailController.text.isEmpty) {
  //       setState(() {});
  //     }
  //   });

  // late final TextEditingController pwdController = TextEditingController()
  //   ..addListener(() {
  //     if (pwdController.text.isEmpty) {
  //       setState(() {});
  //     }
  //   });

  final _formKey = GlobalKey<FormState>();

  late bool show = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 153, 169, 232),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text('Đăng nhập',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  top: 10.0,
                                  right: 20.0,
                                  bottom: 10.0),
                              child: CustomTextField(label: 'Email')),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  top: 10.0,
                                  right: 20.0,
                                  bottom: 10.0),
                              child: CustomTextField(label: 'Password')),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(color: Color(0xFF49454F)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ]),
                  )),
            ),
          ],
        )));
  }
}
