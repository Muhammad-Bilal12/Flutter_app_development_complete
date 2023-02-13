import "package:flutter/src/widgets/placeholder.dart";
import "package:flutter/src/widgets/framework.dart";
import "package:flutter/material.dart";

import "screens/home_screen.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Provider",
      home: HomeScreen(),
    );
  }
}