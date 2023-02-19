import "package:emart_app/consts/consts.dart";

Widget customTextFeild({String? title, String? hint, controller,isPass = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            filled: true,
            fillColor: lightGrey,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
    ],
  );
}
