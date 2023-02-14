import "package:flutter/material.dart";

import "../app_colors.dart";

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton(
      {super.key,
      required this.title,
      this.isLoading = false,
      required this.onPress});
  final String title;
  final bool isLoading;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: AppColor.greenColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: isLoading == true
              ? const CircularProgressIndicator()
              : Text(title,style: const TextStyle(fontSize: 18,color: AppColor.whiteColor),),
        ),
      ),
    );
  }
}
