import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 5,
            top: 5,
            child: Icon(
              Icons.call,
              size: 30,
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: Icon(
              Icons.contact_mail,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
