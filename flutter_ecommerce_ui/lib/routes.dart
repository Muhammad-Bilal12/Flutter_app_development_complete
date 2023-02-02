import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/screens/forgot_screen/forgot_password_screen.dart';
import 'package:flutter_ecommerce_ui/screens/login_success/login_success_screen.dart';
import 'package:flutter_ecommerce_ui/screens/onboard/onboard.dart';
import 'package:flutter_ecommerce_ui/screens/sign_in/signin_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoard.routeName: (context) => const OnBoard(),
  SignIn.routeName: (context) => const SignIn(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
};
