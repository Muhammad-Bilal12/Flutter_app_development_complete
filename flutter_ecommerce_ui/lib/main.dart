import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/routes.dart';
import 'package:flutter_ecommerce_ui/screens/onboard/onboard.dart';
import 'package:flutter_ecommerce_ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce UI',
      theme: theme(),
      // home: const OnBoard(),

      initialRoute: OnBoard.routeName,
      routes: routes,
    );
  }
}
