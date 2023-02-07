import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/components/default_btn.dart';
import 'package:flutter_ecommerce_ui/size_config.dart';

import 'component/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});
  static String routeName = "/loginSuccess";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Success")),
      body: Body(),
    );
  }
}
