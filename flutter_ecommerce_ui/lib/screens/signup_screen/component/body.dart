import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/constant.dart';
import 'package:flutter_ecommerce_ui/size_config.dart';

import '../../../components/social_card.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.02),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
                "Complete your details\nand continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.07),
              const SignupForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    svg: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    svg: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    svg: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              const Text(
                "By continuing that you confirm that you agree\nwith our Terms and Condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
