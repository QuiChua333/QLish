import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static final String SUCCESS = 'success';
  static final String ERROR = 'error';
  static void show(String message, String type) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: type == 'success' ? Colors.green : Colors.red,
    );
  }
}