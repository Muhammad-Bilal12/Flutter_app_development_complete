import 'package:flutter/material.dart';
import 'package:flutter_restapi/screens/example_three/example_four.dart';
import 'package:flutter_restapi/screens/example_three/example_three_screen.dart';
import 'package:flutter_restapi/screens/example_two_scree.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: const ExampleFour(),
    );
  }
}
