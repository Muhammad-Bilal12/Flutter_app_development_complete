import "package:flutter/material.dart";
import 'package:flutter_ecommerce_ui/screens/signup_screen/signup_screen.dart';

import '../constant.dart';
import '../size_config.dart';

class NonActionText extends StatelessWidget {
  const NonActionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignupScreen.routeName),
          child: Text(
            text,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(16)),
          ),
        ),
      ],
    );
  }
}
