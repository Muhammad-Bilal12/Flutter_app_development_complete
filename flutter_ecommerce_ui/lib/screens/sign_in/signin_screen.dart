import "package:flutter/material.dart";

import 'component/body.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  static String routeName = "/signIn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
