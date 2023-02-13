import 'package:flutter/material.dart';

class HomeScreenProvider with ChangeNotifier {
  bool? isEligible;
  String eligibleMsg = "";

  void checkEligibility(String age){
    if(int.parse(age) >= 18){
      isEligible = true;
      eligibleMsg = "You are Eligible!";
      notifyListeners();
    }else{
      isEligible = false;
      eligibleMsg = "You are not Eligible!";
      notifyListeners();
    }
  }
}
