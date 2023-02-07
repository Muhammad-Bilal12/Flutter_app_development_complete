import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/constant.dart';
import 'package:flutter_ecommerce_ui/screens/complete_profile/component/profile_form.dart';
import 'package:flutter_ecommerce_ui/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              Text(
                "Complete Profile",
                style: headingStyle,
              ),
              const Text(
                "Complete Your Details\n continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              const CompleteDetailForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              const Text(
                "By continuing your confirm that you agree\nwith our Terms and Conditions",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
