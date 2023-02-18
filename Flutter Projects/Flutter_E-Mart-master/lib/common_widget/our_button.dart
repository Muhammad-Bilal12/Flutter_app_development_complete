import 'package:emart_app/consts/consts.dart';

Widget ourButton({Color? color, Color? textColor, String ? title,Function()? onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: color,
      ),
      onPressed: onPress,
      child: title!.text.fontFamily(bold).color(textColor).make());
}
