import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();

    FocusScope.of(context).requestFocus(nextFocus);
  }

// scaffold message
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
