import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.text,
    this.color = Colors.grey,
    required this.press,
  }) : super(key: key);

  final String text;
  final Color color;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;

    return InkWell(
      radius: width * 0.1,
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: height * 0.1,
        width: width * 0.2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
