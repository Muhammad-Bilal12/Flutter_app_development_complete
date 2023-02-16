import 'package:firebase_tut/firebase_services/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splash = SplashService();
  @override
  void initState() {
    super.initState();
    splash.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Text("Firebase Tutorial",
            style: TextStyle(fontSize: 36, color: Colors.white)),
      ),
    );
  }
}
