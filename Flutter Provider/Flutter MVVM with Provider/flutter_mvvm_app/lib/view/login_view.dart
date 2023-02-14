import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/utils/utils.dart';
import 'package:flutter_mvvm_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/components/rounded_border_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecuredText = ValueNotifier<bool>(true);
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // @override
  // void dispose() {
  //   super.dispose();

  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _emailFocusNode.dispose();
  //   _passwordFocusNode.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                "Login",
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
                title: "Login",
                isLoading: authviewModel.isLoading,
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

                    authviewModel.loginApi(data, context);
                  }
                }),
          ],
        ),
      )),
    );
  }
}


// login password
// {
//     "email": "eve.holt@reqres.in",
//     "password": "cityslicka"
// }

