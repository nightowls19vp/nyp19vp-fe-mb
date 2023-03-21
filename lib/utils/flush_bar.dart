import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void show_Custom_Flushbar(String message, BuildContext context) {
  Flushbar(
    duration: Duration(seconds: 3),
    margin: EdgeInsets.all(30),
    padding: EdgeInsets.all(15),
    backgroundColor: Color.fromARGB(255, 57, 159, 103),
    borderRadius: BorderRadius.circular(7),
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    messageText: Text(
      message,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
    ),
  )..show(context);
}
