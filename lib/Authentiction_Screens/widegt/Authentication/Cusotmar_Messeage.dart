// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

message(BuildContext context,
    {required String textMessage, required color, required textColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        textMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    ),
  );
}
