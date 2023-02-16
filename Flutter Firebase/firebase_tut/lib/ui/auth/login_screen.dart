import 'package:firebase_tut/ui/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/rounded_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == "") {
                        return "enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _passswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.trim() == "") {
                        return "enter your password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "password",
                      prefixIcon: Icon(Icons.lock_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                 
                  RoundBtn(
                    title: "Login",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        print("login");
                      }
                    },
                  ), Row(
                    children: [
                      Text("Don't have an account"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                    }, child: Text("Signup")),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
