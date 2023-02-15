import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/repo/auth_repository.dart';
import 'package:flutter_mvvm_app/utils/utils.dart';
import 'package:flutter_mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();

// For login api 
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setIsLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }


// For signup api 
  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  setSignUpLoading(bool value){
    _signupLoading = value;
    notifyListeners();
  }

// Login Api Function
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setIsLoading(true);
    _myrepo.loginApi(data).then((value) {
  final userPreference = Provider.of<UserViewModel>(context,listen: false); // because we dont need to build widget
  userPreference.saveUser(
    UserModel(token: value['token'].toString())
  );
    setIsLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
        Utils.toastMessage("Login Successfully");
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setIsLoading(false);
        Utils.toastMessage(error.toString());
      if (kDebugMode) {

        print(error.toString());
      }
    });
  }


// SignUp Api Function
  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myrepo.signUpApi(data).then((value) {
    setSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
        Utils.toastMessage("Signup Successfully");
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
        Utils.toastMessage(error.toString());
      if (kDebugMode) {

        print(error.toString());
      }
    });
  }



}
