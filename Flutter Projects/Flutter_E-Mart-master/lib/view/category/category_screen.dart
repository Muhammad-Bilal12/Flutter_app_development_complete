import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/view/category/category_detail_screen.dart';
import 'package:get/get.dart';

import "../../common_widget/bg_widget.dart";

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: categories.text.white.fontFamily(semibold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(categoryImages[index],
                      width: 200, height: 120, fit: BoxFit.cover),
                  10.heightBox,
                  categoryTitleList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .size(16)
                      .make()
                ],
              )
                  .box
                  .white
                  .clip(Clip.antiAlias)
                  .roundedSM
                  .outerShadowSm
                  .make()
                  .onTap(() {
                Get.to(CategoryDetailScreen(title: categoryTitleList[index]));
              });
            },
          ),
        ),
      ),
    );
  }
}
