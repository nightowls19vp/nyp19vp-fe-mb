import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nyp19vp_mb/constants/status_type.dart';
import 'package:nyp19vp_mb/res/colors.dart';

Future<void> showCustomizeFlushbar(
    StatusType type, String errorMsg, BuildContext context) {
  return Flushbar(
    messageText: Text(
      errorMsg,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
        color: Color(0xFFFEFEFE),
        fontWeight: FontWeight.bold,
      ),
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 5,
      )
    ],
    duration: Duration(seconds: 2),
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 26.0),
    margin: EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(8.0),
    backgroundColor:
        (type == StatusType.fail) ? AppColors.error : AppColors.success,
    flushbarPosition: FlushbarPosition.TOP,
    forwardAnimationCurve: Curves.bounceIn,
  ).show(context);
}
