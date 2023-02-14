import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mvvm_app/utils/utils.dart';
import 'package:provider/provider.dart';

import '../res/components/rounded_border_button.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecuredText = ValueNotifier<bool>(true);
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Signup",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: height * 0.01),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.feildFocusChange(
                    context, _emailFocusNode, _passwordFocusNode);
              },
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: height * 0.01),
            ValueListenableBuilder(
              valueListenable: _obsecuredText,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: value,
                  keyboardType: TextInputType.text,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: () {
                        _obsecuredText.value = !value;
                      },
                      child: Icon(value == true
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.02),
            RoundedBorderButton(
                title: "Sign Up",
                isLoading: authviewModel.signupLoading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.toastMessage("Please Enter your Email Address");
                  } else if (_passwordController.text.isEmpty) {
                    Utils.toastMessage("Please Enter your password");
                  } else if (_passwordController.text.length < 6) {
                    Utils.toastMessage("Password must be 6 character long");
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authviewModel.signupApi(data, context);
                  }
                }),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: const Text("Already have an account! Signin")),
          ],
        ),
      )),
    );
  }
}