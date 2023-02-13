import 'package:flutter_mvvm_app/data/network/base_api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import '../app_exception.dart';

class NetworkApiResponse extends BaseApiRespose{
  @override
  Future getGetApiResponse(String? url) async{
 
 dynamic responseJson;
 try {
   
   final response = await http.get(Uri.parse(url!)).timeout(Duration(seconds: 10));
   responseJson = returnResponse(response);
 } on SocketException{
  throw FetchDataException("No Internet Connection");
 }
 
 return responseJson;
  }

  @override
  Future getPostApiResponse(String? url, data)async {
   
 dynamic responseJson;
 try {
   final response = await http.post(
    Uri.parse(url!),
    body: data
   );
 } on SocketException{
  throw FetchDataException("No Internet Connection");
 }
 
 return responseJson;
  }

dynamic returnResponse(http.Response response){
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        case 400:
        throw BadRequestException(response.body.toString());
        case 500:
        case 404:
        throw UnAuthorisedException(response.body.toString());
    default:
    throw FetchDataException("Error Occured while Communication with server with status code ${response.statusCode.toString()}");
  }
}


}