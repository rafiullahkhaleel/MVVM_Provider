import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/resources/app_url.dart';

class MoviesRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<MoviesModel> fetchMoviesList() async {
    try {
      final response = await _apiServices.getGetApiResponse(
        AppUrl.moviesListUrl,
      );
      return MoviesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
