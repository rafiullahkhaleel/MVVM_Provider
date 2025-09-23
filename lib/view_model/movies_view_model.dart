import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/repository/movies_repository.dart';

class MoviesViewModel extends ChangeNotifier {
  final MoviesRepository _moviesRepository = MoviesRepository();
  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MoviesModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList() async {
    setMoviesList(ApiResponse.loading());
    _moviesRepository
        .fetchMoviesList()
        .then((data) {
          setMoviesList(ApiResponse.completed(data));
        })
        .onError((error, stackTrace) {
          setMoviesList(ApiResponse.error(error.toString()));
        });
  }
}
