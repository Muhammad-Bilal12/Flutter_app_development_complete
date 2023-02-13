
import 'package:flutter_mvvm_app/data/response/status.dart';

class ApiResponse<T>{

Stauts? stauts;
T? data;
String? message;

ApiResponse(this.stauts,this.data,this.message);

ApiResponse.loading() : stauts = Stauts.LOADING;
ApiResponse.completed() : stauts = Stauts.COMPLETED;
ApiResponse.error() : stauts = Stauts.ERROR;

@override
  String toString() {
    return " Status: $stauts\n Message: $message \n Data: $data";
  }



}