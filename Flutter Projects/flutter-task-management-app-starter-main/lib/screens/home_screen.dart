import "package:flutter/material.dart";

import "../widgets/premium_card.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoPremium(),
        ],
      ),
    );
  }

  AppBar _buildCustomAppBar() {
    return AppBar(
      title: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/avatar.jpg", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 20))
      ],
    );
  }
}
