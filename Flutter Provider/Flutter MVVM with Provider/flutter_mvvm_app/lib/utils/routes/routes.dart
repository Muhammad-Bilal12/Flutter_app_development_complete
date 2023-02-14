import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_app/view/home_screen.dart';

import '../../view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {

    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
        
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
        
      default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(child: Text("No Route Defined"),),
        );
      },);
    }

  }
}
