import "package:flutter/material.dart";
import 'package:flutter_ecommerce_ui/screens/otp_verification/otp_screen.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_btn.dart';
import '../../../components/form_error.dart';
import '../../../constant.dart';
import '../../../size_config.dart';

class CompleteDetailForm extends StatefulWidget {
  const CompleteDetailForm({super.key});

  @override
  State<CompleteDetailForm> createState() => _CompleteDetailFormState();
}

class _CompleteDetailFormState extends State<CompleteDetailForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName, lastname, phoneNumber, address;

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
          buildNameFromFeild(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormFeild(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumFormFeild(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormFeild(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultBtn(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  // Go to OTP Screen
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }
              })
        ],
      ),
    );
  }

// Address
  TextFormField buildAddressFormFeild() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      onSaved: (newValue) => address = newValue,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text("Address"),
        hintText: "Enter Your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

// Phone Number
  TextFormField buildPhoneNumFormFeild() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      onSaved: (newValue) => phoneNumber = newValue,
      decoration: const InputDecoration(
        label: Text("Phone Number"),
        hintText: "Enter Your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

// Last Name
  TextFormField buildLastNameFormFeild() {
    return TextFormField(
      onSaved: (newValue) => lastname = newValue,
      decoration: const InputDecoration(
        label: Text("Last Name"),
        hintText: "Enter Your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

// First Name
  TextFormField buildNameFromFeild() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      onSaved: (newValue) => firstName = newValue,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text("First Name"),
        hintText: "Enter Your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
