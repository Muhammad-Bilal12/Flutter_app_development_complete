import "package:emart_app/consts/consts.dart";
import "package:emart_app/view/auth_screen/signup_screen.dart";
import "package:get/get.dart";

import "../../common_widget/app_logo_box.dart";
import "../../common_widget/bg_widget.dart";
import "../../common_widget/custom_textfeild.dart";
import "../../common_widget/our_button.dart";
import "../../consts/list.dart";
import "../../controller/auth_controller.dart";
import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller
    final controller = Get.put(AuthController());

    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Login to $appname".text.fontFamily(bold).white.size(18).make(),
            30.heightBox,
            Column(
              children: [
                customTextFeild(
                    title: email,
                    hint: emailHint,
                    controller: controller.emailController),
                10.heightBox,
                customTextFeild(
                    title: password,
                    hint: passwordHint,
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgotPassword.text.make())),
                5.heightBox,
                ourButton(
                    title: login,
                    color: redColor,
                    textColor: whiteColor,
                    onPress: () async {
                      if (
                          controller.emailController.text != '' &&
                          controller.passwordController.text != ''
                          ) {
                       
                        
                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(const Home());
                            });
                       
                        } else{
                          VxToast.show(context, msg: nullError);
                        }
                     
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                    title: signup,
                    color: lightGolden,
                    textColor: redColor,
                    onPress: () {
                      Get.to(const SignUpScreen());
                    }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                loginWith.text.color(fontGrey).make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: lightGrey,
                              child: Image.asset(
                                socialiconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                ),
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
