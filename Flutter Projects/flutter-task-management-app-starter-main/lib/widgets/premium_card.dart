import "package:flutter/material.dart";

class GoPremium extends StatelessWidget {
  const GoPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.star, color: Colors.white),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Go Premium"),
                  Text("Get Unlimited Access\nto all our features.")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
