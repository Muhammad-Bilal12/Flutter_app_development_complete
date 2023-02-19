import "package:emart_app/consts/consts.dart";

Widget detailCard({width,String? count,String ? title}){
 return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  count!
                      .text
                      .fontFamily(bold)
                      .size(16)
                      .color(darkFontGrey)
                      .make(),
                  5.heightBox,
                  title!
                      .text
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .make(),
                ],
              )
                  .box
                  .roundedSM
                  .width(width)
                  .height(80)
                  .white
                  .padding(const EdgeInsets.all(4))
                  .make();
           
}