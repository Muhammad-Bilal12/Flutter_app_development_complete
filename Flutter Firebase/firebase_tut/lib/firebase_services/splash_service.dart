import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:firebase_tut/ui/firestore/firestore_data_screen.dart';
import 'package:firebase_tut/ui/homeScreen.dart';
import 'package:firebase_tut/ui/upload_image/upload_image_screen.dart';
import 'package:flutter/material.dart';

import '../ui/post_screen/post_screen.dart';

class SplashService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void isLogin(BuildContext context) {
    final user = _auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
      );
    }
  }
}
