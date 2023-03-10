import "dart:io";

import "package:emart_app/common_widget/bg_widget.dart";
import "package:emart_app/common_widget/custom_textfeild.dart";
import "package:emart_app/common_widget/our_button.dart";
import "package:emart_app/consts/consts.dart";
import "package:emart_app/controller/profile_controller.dart";
import "package:get/get.dart";

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return BgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: whiteColor),
          title: editProfile.text.make(),
        ),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                  ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .shadowSm
                      .clip(Clip.antiAlias)
                      .make()
                  : data['imageUrl'] != '' &&
                          controller.profileImagePath.isEmpty
                      ? Image.network(data['imageUrl'],
                              width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .shadowSm
                          .clip(Clip.antiAlias)
                          .make()
                      : Image.file(File(controller.profileImagePath.value),
                              width: 100,
                              alignment: Alignment.center,
                              fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .shadowSm
                          .clip(Clip.antiAlias)
                          .make(),
              10.heightBox,
              ourButton(
                title: "Edit",
                textColor: whiteColor,
                color: redColor,
                onPress: () {
                  controller.changeImage(context);
                },
              ),
              const Divider(
                color: lightGrey,
              ),
              20.heightBox,
              customTextFeild(
                  title: name,
                  hint: namehint,
                  controller: controller.nameController),
              5.heightBox,
              customTextFeild(
                  title: oldPass,
                  hint: passwordHint,
                  controller: controller.oldPasswordController,
                  isPass: true),
              5.heightBox,
              customTextFeild(
                  title: newPass,
                  hint: passwordHint,
                  controller: controller.newPasswordController,
                  isPass: true),
              20.heightBox,
              controller.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: ourButton(
                        title: "Save",
                        textColor: whiteColor,
                        color: redColor,
                        onPress: () async {
                          controller.isLoading(true);

                          // if image is not selected

                          if (controller.profileImagePath.value.isNotEmpty) {
                            await controller.uploadImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }
                          // if old is matches to database password

                          if (data['password'] ==
                              controller.oldPasswordController.text) {
                            await controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldPasswordController.text,
                                newPassword:
                                    controller.newPasswordController.text);
                            await controller.updateProfile(
                                name: controller.nameController.text,
                                imgUrl: controller.profileImageLink,
                                password:
                                    controller.newPasswordController.text);
                            VxToast.show(context, msg: "Updated");
                          } else {
                            VxToast.show(context,
                                msg: "Password is not matched!");
                            controller.isLoading(false);
                          }
                        },
                      ),
                    ),
            ],
          )
              .box
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, right: 12, left: 12))
              .white
              .rounded
              .make(),
        ),
      ),
    );
  }
}
