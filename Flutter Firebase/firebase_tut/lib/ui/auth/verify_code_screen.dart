import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_tut/widgets/rounded_btn.dart";
import "package:flutter/material.dart";

import "../../utils/utils.dart";
import "../post_screen/post_screen.dart";

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, required this.verificationID});

  final String verificationID;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isLoading = false;

  final _verifyCodeController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void verify() async {
    setState(() {
      isLoading = true;
    });
    final crendital = PhoneAuthProvider.credential(
        verificationId: widget.verificationID,
        smsCode: _verifyCodeController.text.toString());

    try {
      await _auth.signInWithCredential(crendital);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Utils.toastMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _verifyCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter your 6 Digit code",
                prefixIcon: Icon(Icons.verified),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundBtn(
                title: "Verify",
                loading: isLoading,
                onPress: () {
                  verify();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostScreen()));
                })
          ],
        ),
      ),
    );
  }
}
