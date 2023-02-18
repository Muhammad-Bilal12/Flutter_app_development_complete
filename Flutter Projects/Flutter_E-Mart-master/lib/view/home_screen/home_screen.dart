import 'package:emart_app/common_widget/home_buttons.dart';
import 'package:emart_app/consts/consts.dart';

import '../../common_widget/featured_btn.dart';
import '../../consts/list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(
          child: Column(
        children: [
          // Search Box
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              autofocus: false,
              decoration: const InputDecoration(
                fillColor: whiteColor,
                filled: true,
                border: InputBorder.none,
                hintText: searchAnithing,
                suffixIcon: Icon(Icons.search),
                hintStyle: TextStyle(color: textfieldGrey),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Velocity X Swiper

                  VxSwiper.builder(
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    aspectRatio: 16 / 9,
                    height: 150,
                    autoPlay: true,
                    itemCount: sliderList.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        sliderList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .shadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  10.heightBox,
                  //  card list
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      2,
                      (index) => homeButtons(
                        height: context.screenHeight * 0.15,
                        width: context.screenWidth / 2.5,
                        icon: index == 0 ? icTodaysDeal : icFlashDeal,
                        title: index == 0 ? todaydeal : flashSale,
                        onPress: () {},
                      ),
                    ),
                  ),
                  10.heightBox,
                  // 2nd Swipper

                  VxSwiper.builder(
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    aspectRatio: 16 / 9,
                    height: 150,
                    reverse: true,
                    autoPlay: true,
                    itemCount: secondSliderList.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondSliderList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .shadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  10.heightBox,
                  // Card List
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => homeButtons(
                        height: context.screenHeight * 0.15,
                        width: context.screenWidth / 3.5,
                        icon: index == 0
                            ? icCategories
                            : index == 1
                                ? icBrands
                                : icTopSeller,
                        title: index == 0
                            ? topCategory
                            : index == 1
                                ? brands
                                : topSeller,
                        onPress: () {},
                      ),
                    ),
                  ),

                  // Featured Categories
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategory.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make()),

                  20.heightBox,

                  // Featured Product 1

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        featuredTitleList1.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: featuredButton(
                              title: featuredTitleList1[index],
                              icon: featuredImagesList1[index]),
                        ),
                      ),
                    ),
                  ),
                  10.heightBox,

                  // Featured Product 2

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        featuredTitleList2.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: featuredButton(
                              title: featuredTitleList2[index],
                              icon: featuredImagesList2[index]),
                        ),
                      ),
                    ),
                  ),
                  // Featured Products
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: redColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        feauturedProducts.text
                            .fontFamily(bold)
                            .white
                            .size(18)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              6,
                              (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(imgP1,
                                      width: 150, fit: BoxFit.cover),
                                  10.heightBox,
                                  "Laptop G-650 / 8GB Ram"
                                      .text
                                      .color(darkFontGrey)
                                      .size(16)
                                      .fontFamily(semibold)
                                      .make(),
                                  10.heightBox,
                                  "\$600"
                                      .text
                                      .color(redColor)
                                      .size(18)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 8))
                                  .roundedSM
                                  .padding(const EdgeInsets.all(8))
                                  .make(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  // 3rd VX swipper
                  VxSwiper.builder(
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    aspectRatio: 16 / 9,
                    height: 150,
                    reverse: true,
                    autoPlay: true,
                    itemCount: secondSliderList.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondSliderList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .shadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  20.heightBox,
                  // All Products
                  Align(
                      alignment: Alignment.centerLeft,
                      child: allProducts.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make()),
                  20.heightBox,
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 300),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imgPi5,
                              width: 200, height: 200, fit: BoxFit.cover),
                          10.heightBox,
                          "Laptop G-650 / 8GB Ram"
                              .text
                              .color(darkFontGrey)
                              .size(16)
                              .fontFamily(semibold)
                              .make(),
                          const Spacer(),
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
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .roundedSM
                          .padding(const EdgeInsets.all(12))
                          .make();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
