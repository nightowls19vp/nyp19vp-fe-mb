import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController emailController = TextEditingController()
    ..addListener(() {
      if (emailController.text.isEmpty) {
        setState(() {});
      }
    });

  late final TextEditingController pwdController = TextEditingController()
    ..addListener(() {
      if (pwdController.text.isEmpty) {
        setState(() {});
      }
    });

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
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, top: 15.0, right: 30.0, bottom: 15.0),
                        child: TextFormField(
                          // initialValue: 'Input your email',\
                          controller: emailController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'email@xyz.com',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            helperText: 'Enter your email',
                            suffixIcon: emailController.text.isEmpty
                                ? null
                                : IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.clear),
                                  ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, top: 15.0, right: 30.0, bottom: 15.0),
                        child: TextFormField(
                          // initialValue: 'Input text',
                          controller: pwdController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            helperText: 'Enter your password',
                            suffixIcon: pwdController.text.isEmpty
                                ? null
                                : IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.clear),
                                  ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                          ),
                        )),
                  ]),
            ),
          ],
        )));
  }
}
