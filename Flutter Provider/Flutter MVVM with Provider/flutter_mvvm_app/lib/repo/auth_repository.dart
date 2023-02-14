import 'package:flutter_mvvm_app/data/network/base_api_response.dart';
import 'package:flutter_mvvm_app/data/network/networt_api_response.dart';

import '../utils/app_url.dart';

class AuthRepository {
// we used BaseApiResponses == BaseApiServices
// we used NetworkApiResponses == NetworkApiServices

 final BaseApiRespose _apiServices = NetworkApiResponse();


// hit api for login user
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
    return e;
    }
  }

  
// hit api for Register user
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      return e;
    }
  }




}
