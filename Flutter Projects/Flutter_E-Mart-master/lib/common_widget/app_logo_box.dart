import 'package:emart_app/consts/consts.dart';

Widget appLogoWidget() {
// Using Velocity - X
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
