import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui/size_config.dart';

import 'component/body.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
