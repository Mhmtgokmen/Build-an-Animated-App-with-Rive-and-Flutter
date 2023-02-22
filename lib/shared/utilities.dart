import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utilities{
  static void showMessage(
      {required BuildContext context,
      required String message,
      Duration duration = const Duration(seconds: 3),
      FlushbarPosition flushbarPosition = FlushbarPosition.TOP}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      backgroundColor: const Color(0xFF5052A2),
      borderRadius: BorderRadius.circular(15),
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}