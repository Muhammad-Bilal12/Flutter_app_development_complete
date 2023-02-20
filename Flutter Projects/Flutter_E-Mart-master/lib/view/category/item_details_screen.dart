import 'package:emart_app/common_widget/our_button.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key, required this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: data['p_name']
            .toString()
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Swiper Section
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      viewportFraction: 1.0,
                      itemCount: data['p_imgs'].length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          data['p_imgs'][index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    // Title and Detail section
                    10.heightBox,
                    data['p_name']
                        .toString()
                        .text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    // Rating Box
                    VxRating(
                      isSelectable: false,
                      value: double.parse(data['p_ratings']),
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      maxRating: 5,
                    ),
                    10.heightBox,
                    "${data['p_price']}"
                        .numCurrency
                        .text
                        .fontFamily(bold)
                        .color(redColor)
                        .size(18)
                        .make(),
                    10.heightBox,

                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "${data['p_seller']}"
                                .text
                                .white
                                .fontFamily(semibold)
                                .make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .color(redColor)
                                .fontFamily(semibold)
                                .make(),
                          ],
                        )),
                        CircleAvatar(
                          backgroundColor: whiteColor,
                          child: const Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ).box.height(70).color(textfieldGrey).make(),
                        ),
                      ],
                    )
                        .box
                        .height(70)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    // Color Section
                    20.heightBox,
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: "Color: "
                                      .text
                                      .color(textfieldGrey)
                                      .fontFamily(semibold)
                                      .make()),
                              Row(
                                children: List.generate(
                                    data['p_colors'].length,
                                    (index) => Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            VxBox()
                                                .size(30, 30)
                                                .roundedFull
                                                .color(Color(
                                                        data['p_colors'][index])
                                                    .withOpacity(1.0))
                                                .margin(
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4))
                                                .make()
                                                .onTap(() {
                                              controller
                                                  .changeColorIndex(index);
                                            }),
                                            Visibility(
                                                visible: index ==
                                                        controller
                                                            .colorIndex.value
                                                    ? true
                                                    : false,
                                                child: const Icon(Icons.check,
                                                    color: whiteColor)),
                                          ],
                                        )),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                          // Quantity Section

                          Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: "Quantity: "
                                      .text
                                      .color(textfieldGrey)
                                      .fontFamily(semibold)
                                      .make()),
                              Obx(
                                () => Row(children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.decreaseQuantity();

                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.remove)),
                                  controller.quantity.value.text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                      onPressed: () {
                                        controller.increaseQuantity(
                                            int.parse(data['p_quantity']));
                                        controller.calculateTotalPrice(
                                            int.parse(data['p_price']));
                                      },
                                      icon: const Icon(Icons.add)),
                                  10.heightBox,
                                  "(${data['p_quantity']} available)"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ]),
                              )
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),

                          // Total Section

                          Row(
                            children: [
                              SizedBox(
                                  width: 100,
                                  child: "Total: "
                                      .text
                                      .color(textfieldGrey)
                                      .fontFamily(semibold)
                                      .make()),
                              "${controller.totalPrice.value}"
                                  .text
                                  .size(16)
                                  .fontFamily(semibold)
                                  .color(redColor)
                                  .make(),
                            ],
                          ).box.padding(const EdgeInsets.all(8)).make(),
                        ],
                      ).box.white.shadowSm.make(),
                    ),

                    // Description Section
                    10.heightBox,
                    "Description"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    "${data['p_description']}".text.color(darkFontGrey).make(),
                    10.heightBox,

                    // Button Section
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          5,
                          (index) => Card(
                                child: ListTile(
                                  title: itemDetailButtonList[index]
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                ),
                              )),
                    ),
                    20.heightBox,
                    // product like section
                    productYouLike.text
                        .size(16)
                        .fontFamily(bold)
                        .color(darkFontGrey)
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
                              Image.asset(imgP1, width: 150, fit: BoxFit.cover),
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
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .roundedSM
                              .padding(const EdgeInsets.all(8))
                              .make(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                title: "Add to Cart",
                onPress: () {},
                textColor: whiteColor,
                color: redColor),
          ),
        ],
      ),
    );
  }
}
