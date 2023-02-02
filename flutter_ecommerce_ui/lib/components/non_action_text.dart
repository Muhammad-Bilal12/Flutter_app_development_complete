import "package:flutter/material.dart";

import '../constant.dart';
import '../size_config.dart';

class NonActionText extends StatelessWidget {
  const NonActionText({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Function() press;

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
          onTap: press,
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
