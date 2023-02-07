import "package:flutter/material.dart";

import 'component/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static String routeName = "/otp_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp Verification"),
      ),
      body: Body(),
    );
  }
}
