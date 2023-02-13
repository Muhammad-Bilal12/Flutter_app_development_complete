import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/utils/routes/routes.dart';
import 'package:flutter_mvvm_app/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Architecture',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
