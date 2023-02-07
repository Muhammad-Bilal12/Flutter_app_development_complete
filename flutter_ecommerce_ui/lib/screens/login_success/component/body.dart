import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/screens/home/home_screen.dart';

import '../../../components/default_btn.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenHeight! * 0.04),
        Image.asset("assets/images/success.png",
            fit: BoxFit.cover, height: SizeConfig.screenHeight! * 0.4),
        SizedBox(height: SizeConfig.screenHeight! * 0.08),
        Center(
          child: Text("Login Success",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        const Spacer(),
        Center(
          child: SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: DefaultBtn(
              text: "Back To Home",
              press: () => Navigator.pushNamed(context, HomeScreen.routeName),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
