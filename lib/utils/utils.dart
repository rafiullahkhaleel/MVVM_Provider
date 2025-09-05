import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static showFlushBarMessage(String message, BuildContext context) {
    // Flushbar(
    //   message: message,
    //   duration: const Duration(seconds: 3),
    //   backgroundColor: Colors.red,
    // ).show(context);
    showFlushbar(context: context, flushbar:  Flushbar(
      message: message,
      duration: Duration(seconds: 3),
    )..show(context));
  }
}
