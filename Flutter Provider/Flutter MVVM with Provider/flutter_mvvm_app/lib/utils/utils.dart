import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

// Average rating
static double averageRating(List<int> rating){
  var avgRating = 0;
  for (var i = 0; i < rating.length; i++) {
    avgRating += rating[i]; 
  }
  return double.parse((avgRating/rating.length).toStringAsFixed(1));
}

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
