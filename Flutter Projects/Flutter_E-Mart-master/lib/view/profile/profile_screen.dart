import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/view/auth_screen/login_screen.dart';
import 'package:get/get.dart';

import '../../common_widget/bg_widget.dart';
import '../../consts/list.dart';
import '../../controller/auth_controller.dart';
import 'component/detail_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Edit profile btn

            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: const Icon(
                  Icons.edit,
                  color: whiteColor,
                ).onTap(() {}),
              ),
            ),
            // User detail section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .shadowSm
                      .clip(Clip.antiAlias)
                      .make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.white.fontFamily(semibold).make(),
                        "customer0012gmail.com".text.white.make()
                      ],
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        Get.put(AuthController()).signOutMethod();
                        Get.offAll(const LoginScreen());
                      },
                      child: logout.text.white.fontFamily(semibold).make()),
                ],
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailCard(
                    count: "00",
                    title: "in your cart",
                    width: context.screenWidth / 3.4),
                detailCard(
                    count: "22",
                    title: "in your wishlist",
                    width: context.screenWidth / 3.4),
                detailCard(
                    count: "123",
                    title: "Your Order",
                    width: context.screenWidth / 3.4),
              ],
            ),

            // Button Section

            ListView.separated(
              shrinkWrap: true,
              itemCount: profileBtnTitleList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(profileBtnIconList[index], width: 20),
                  title: profileBtnTitleList[index].text.make(),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: lightGrey,
                );
              },
            )
                .box
                .white
                .roundedSM
                .padding(const EdgeInsets.symmetric(horizontal: 16))
                .shadowSm
                .margin(const EdgeInsets.all(10))
                .make()
                .box
                .color(redColor)
                .bottomRounded(value: 12)
                .make(),
          ],
        ),
      ),
    ));
  }
}
