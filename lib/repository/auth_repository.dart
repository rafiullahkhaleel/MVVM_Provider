import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository{
   BaseApiServices _apiServices = NetworkApiService();

   Future<dynamic> loginApi(dynamic data) async {
     try {
       final response =
       await _apiServices.getPostApiResponse(AppUrl.login, data);
       return response;
     } catch (e) {
       rethrow;
     }
   }

}