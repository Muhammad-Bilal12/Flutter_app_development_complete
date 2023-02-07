import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/screens/complete_profile/complete_pofile_screen.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_btn.dart';
import '../../../components/form_error.dart';
import '../../../constant.dart';
import '../../../size_config.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String? email, password, confirmPassword;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormFeild(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // Confirm Password
            SizedBox(height: getProportionateScreenHeight(40)),
            buildConfirmFromFeild(),
            FormError(errors: errors),
            DefaultBtn(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    // Go to profile Page
                    Navigator.pushNamed(
                        context, CompleteProfileScreen.routeName);
                  }
                }),
          ],
        ));
  }

  TextFormField buildConfirmFromFeild() {
    return TextFormField(
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        return;
      },
      onSaved: (newValue) => confirmPassword = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);

          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        label: Text("Confirm Password"),
        hintText: "Confirm Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormFeild() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (value.length < 8 && errors.contains(kShortPassError)) {
          removeError(error: kShortPassError);
        }
        password = value;
        return;
      },
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          addError(error: kShortPassError);

          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        label: Text("Password"),
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text("Email"),
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
