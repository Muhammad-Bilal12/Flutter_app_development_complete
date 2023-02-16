import 'dart:async';

import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => const LoginScreen(),),
        );
      },
    );
  }
}
