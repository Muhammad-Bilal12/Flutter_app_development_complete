import 'dart:async';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';

import '../../common_widget/app_logo_box.dart';

import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


// Change Screen
void changeScreen (){
  // Future.delayed(const Duration(seconds: 3),() {
  //   Get.to(const LoginScreen());
  // },);

  Timer(Duration(seconds: 3), () {
    Get.to(LoginScreen());
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
