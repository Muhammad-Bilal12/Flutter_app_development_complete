
import 'package:flutter/material.dart';

class RoundBtn extends StatelessWidget {
  const RoundBtn({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurple,
        ),
        child: Center(
          child: Text(title,
              style: const TextStyle(fontSize: 24, color: Colors.white),textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
