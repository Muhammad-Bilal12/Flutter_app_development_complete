import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/constant.dart';
import 'package:flutter_ecommerce_ui/screens/forgot_screen/forgot_password_screen.dart';
import 'package:flutter_ecommerce_ui/screens/sign_in/component/sign_form.dart';
import 'package:flutter_ecommerce_ui/size_config.dart';

import '../../../components/social_card.dart';
import '../../../components/non_action_text.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password and\n continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight! * 0.08),
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
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                NonActionText(
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
