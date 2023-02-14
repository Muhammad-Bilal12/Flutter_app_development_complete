import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_app/view/home_screen.dart';

import '../../view/login_view.dart';
import '../../view/signup_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Defined"),
              ),
            );
          },
        );
    }
  }
}
