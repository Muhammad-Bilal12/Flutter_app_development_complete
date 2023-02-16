import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/rounded_btn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();

  // Create Instance for firebase authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Signup Function

  void signup() {
    setState(() {
      isLoading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: _emailController.text.toString(),
            password: _passswordController.text.toString())
        .then((value) {
      setState(() {
        isLoading = false;
        Utils.toastMessage("Signup successfully!");
      });
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      Utils.toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
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
                  const SizedBox(height: 10),
                  RoundBtn(
                    loading: isLoading,
                    title: "Signup",
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        signup();
                      }
                    },
                  ),
                  Row(
                    children: [
                      const Text("Already have an account"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: const Text("Login")),
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
