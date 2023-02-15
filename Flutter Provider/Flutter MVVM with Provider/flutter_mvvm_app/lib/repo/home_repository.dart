import 'package:flutter_mvvm_app/models/movies_model.dart';
import 'package:flutter_mvvm_app/utils/app_url.dart';

import '../data/network/base_api_response.dart';
import '../data/network/networt_api_response.dart';

class HomeRepository {

 final BaseApiRespose _apiServices = NetworkApiResponse();

// hit api for getting Movies data
  Future<dynamic> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.movieListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch(e){
      return e;
    }
  }


}

