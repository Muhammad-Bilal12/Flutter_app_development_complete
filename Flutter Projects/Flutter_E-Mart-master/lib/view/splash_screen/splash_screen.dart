import 'dart:async';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';
import 'package:emart_app/view/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../common_widget/app_logo_box.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// Change Screen
  void changeScreen() {
    Timer(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(const LoginScreen());
        } else {
          Get.to(const Home());
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(icSplashBg, width: 300)),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            const Spacer(),
            appversion.text.fontFamily(semibold).white.make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
