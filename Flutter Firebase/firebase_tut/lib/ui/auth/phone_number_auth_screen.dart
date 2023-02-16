import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/verify_code_screen.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/rounded_btn.dart';

class PhoneNumberVerificationScreen extends StatefulWidget {
  const PhoneNumberVerificationScreen({super.key});

  @override
  State<PhoneNumberVerificationScreen> createState() =>
      _PhoneNumberVerificationScreenState();
}

class _PhoneNumberVerificationScreenState
    extends State<PhoneNumberVerificationScreen> {
  bool isLoading = false;

  final _phoneNumberController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Number Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter your Number",
                prefixIcon: Icon(Icons.call),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundBtn(
                title: "Send Vode",
                loading: isLoading,
                onPress: () {
                  setState(() {
                    isLoading = true;
                  });
                  _auth.verifyPhoneNumber(
                    phoneNumber: _phoneNumberController.text.toString(),
                    verificationCompleted: (PhoneAuthCredential credential) {
                      setState(() {
                        isLoading = true;
                      });
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        Utils.toastMessage(
                            "The provided phone number is not valid.");
                        debugPrint('The provided phone number is not valid.');
                      }
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  VerifyScreen(verificationID: verificationId,)));
                      setState(() {
                        isLoading = false;
                      });
                    },
                    timeout: const Duration(seconds: 60),
                    codeAutoRetrievalTimeout: (e) {
                      Utils.toastMessage(e.toString());
                      setState(() {
                        isLoading = true;
                      });
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
