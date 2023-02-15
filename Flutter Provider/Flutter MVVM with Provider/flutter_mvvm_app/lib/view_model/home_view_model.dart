import 'package:flutter/material.dart';
import 'package:flutter_mvvm_app/data/response/api_response.dart';
import 'package:flutter_mvvm_app/models/movies_model.dart';
import 'package:flutter_mvvm_app/repo/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMovieList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value) {
    setMovieList(ApiResponse.completed(value));

    }).onError((error, stackTrace) {
    setMovieList(ApiResponse.error(error.toString()));
  
    });
  }
}
