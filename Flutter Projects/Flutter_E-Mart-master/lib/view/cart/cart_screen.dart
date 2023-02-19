import 'package:emart_app/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "No Item Found!"
          .text
          .color(darkFontGrey)
          .fontFamily(semibold)
          .makeCentered(),
    );
  }
}
