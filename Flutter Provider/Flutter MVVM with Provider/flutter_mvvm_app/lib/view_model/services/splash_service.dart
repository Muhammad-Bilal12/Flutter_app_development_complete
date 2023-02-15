import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/models/user_model.dart';
import 'package:flutter_mvvm_app/utils/routes/routes_name.dart';

import '../user_view_model.dart';

class SplashService {
  
  Future<UserModel> getUserData() => UserViewModel().getUser();
  
  void checkAuthentication(BuildContext context) async {
    
    getUserData().then((value) {
      
      if (value.token.toString() == 'null' || value.token.toString() == "") {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }else{
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.home);


      }

    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    
    });
  }
}
