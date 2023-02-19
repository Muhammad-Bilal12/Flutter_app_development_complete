import 'package:emart_app/common_widget/bg_widget.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'item_details_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
             iconTheme: const IconThemeData(color: whiteColor),
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .size(12)
                          .makeCentered()
                          .box
                          .rounded
                          .white
                          .size(130, 40)
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make()),
                ),
              ),

// Item Container
              20.heightBox,
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(imgPi5,
                            width: 200, height: 150, fit: BoxFit.cover),
                        10.heightBox,
                        "Laptop G-650 / 8GB Ram"
                            .text
                            .color(darkFontGrey)
                            .size(16)
                            .fontFamily(semibold)
                            .make(),
                        "\$1600"
                            .text
                            .color(redColor)
                            .size(18)
                            .fontFamily(bold)
                            .make(),
                      ],
                    )
                        .box
                        .white
                        .outerShadowSm
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .roundedSM
                        .padding(const EdgeInsets.all(12))
                        .make()
                        .onTap(() {
                      Get.to(const ItemDetailScreen(
                        title: "Dummy Item",
                      ));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
