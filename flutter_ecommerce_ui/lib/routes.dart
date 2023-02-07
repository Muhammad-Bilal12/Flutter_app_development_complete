import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/screens/complete_profile/complete_pofile_screen.dart';
import 'package:flutter_ecommerce_ui/screens/forgot_screen/forgot_password_screen.dart';
import 'package:flutter_ecommerce_ui/screens/login_success/login_success_screen.dart';
import 'package:flutter_ecommerce_ui/screens/onboard/onboard.dart';
import 'package:flutter_ecommerce_ui/screens/otp_verification/otp_screen.dart';
import 'package:flutter_ecommerce_ui/screens/sign_in/signin_screen.dart';
import 'package:flutter_ecommerce_ui/screens/signup_screen/signup_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoard.routeName: (context) => const OnBoard(),
  SignIn.routeName: (context) => const SignIn(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
};
