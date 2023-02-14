import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/repo/auth_repository.dart';
import 'package:flutter_mvvm_app/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  setIsLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setIsLoading(true);
    _myrepo.loginApi(data).then((value) {
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
}
