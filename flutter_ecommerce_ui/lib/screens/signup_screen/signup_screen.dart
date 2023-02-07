import "package:flutter/material.dart";

import 'component/body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
