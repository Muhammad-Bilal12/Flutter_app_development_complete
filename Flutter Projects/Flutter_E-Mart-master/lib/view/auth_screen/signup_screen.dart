import "package:emart_app/consts/consts.dart";
import "package:emart_app/view/auth_screen/login_screen.dart";
import "package:emart_app/view/home_screen/home.dart";
import "package:get/get.dart";

import "../../common_widget/app_logo_box.dart";
import "../../common_widget/bg_widget.dart";
import "../../common_widget/custom_textfeild.dart";
import "../../common_widget/our_button.dart";
import "../../consts/list.dart";
import "../../controller/auth_controller.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheck = false;

  // Controller
  final controller = Get.put(AuthController());
// textFeildController
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "join the $appname".text.fontFamily(bold).white.size(18).make(),
            30.heightBox,
            Column(
              children: [
                customTextFeild(
                    title: name, hint: namehint, controller: nameController),
                10.heightBox,
                customTextFeild(
                    title: email, hint: emailHint, controller: emailController),
                10.heightBox,
                // Password Feild
                customTextFeild(
                    isPass: true,
                    title: password,
                    hint: passwordHint,
                    controller: passwordController),
                10.heightBox,
                customTextFeild(
                    isPass: true,
                    title: retypePassword,
                    hint: retypePasswordHint,
                    controller: rePasswordController),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: redColor,
                      checkColor: whiteColor,
                      value: isCheck,
                      onChanged: (value) {
                        setState(() {
                          isCheck = value!;
                        });
                      },
                    ),
                    5.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey)),
                          TextSpan(
                              text: termsAndCondition,
                              style: TextStyle(
                                  fontFamily: semibold, color: redColor)),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey)),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                  fontFamily: semibold, color: redColor)),
                        ],
                      )),
                    ),
                  ],
                ),
                ourButton(
                    title: signup,
                    color: isCheck == true ? redColor : lightGrey,
                    textColor: whiteColor,
                    onPress: () async {
                      if (nameController.text != '' &&
                          emailController.text != '' &&
                          passwordController.text != '' &&
                          rePasswordController.text != '') {
                        if (isCheck != false) {
                          try {
                            await controller
                                .signUpMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              return (controller.storeUserData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text));
                            }).then((value) {
                              VxToast.show(context, msg: signedup);
                              Get.offAll(const Home());
                            });
                          } catch (e) {
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                          }
                        } else {
                          VxToast.show(context, msg: checkTerms);
                        }
                      } else {
                        VxToast.show(context, msg: nullError);
                      }
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
// Wrap on gesture Detector with velocity X
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: alreadyAccount,
                          style:
                              TextStyle(fontFamily: regular, color: fontGrey)),
                      TextSpan(
                          text: login,
                          style:
                              TextStyle(fontFamily: semibold, color: redColor)),
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                }),
                10.heightBox,
              ],
            )
                .box
                .rounded
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .white
                .width(context.screenWidth - 70)
                .make(),
          ],
        ),
      ),
    ));
  }
}
