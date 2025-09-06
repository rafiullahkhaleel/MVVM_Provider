import 'dart:convert';
import 'dart:io';

import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 15));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data), // 👈 JSON encode
        headers: {
          'Content-Type': 'application/json', // 👈 required
        },
      ).timeout(const Duration(seconds: 15));
      print('🔗 URL: $url');
      print('📤 Request Body: $data');
      print('📥 Response: ${response.body}');
      print('📡 Status Code: ${response.statusCode}');

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      case 400: // Bad Request (validation error etc.)
        throw BadRequestException(response.body.toString());

      case 401: // Unauthorized
      case 403: // Forbidden
        throw UnauthorisedException(response.body.toString());

      case 404: // Wrong URL
        throw FetchDataException("URL not found: ${response.request?.url}");

      default: // Any other error (500, 502, etc.)
        throw FetchDataException(
          "Error During Communication: "
              "${response.statusCode} → ${response.reasonPhrase}\n"
              "${response.body}",
        );
    }
  }
}









// import 'dart:convert';
// import 'dart:io';
//
// import 'package:mvvm/data/app_exception.dart';
// import 'package:mvvm/data/network/base_api_services.dart';
// import 'package:http/http.dart' as http;
//
// class NetworkApiService extends BaseApiServices {
//   @override
//   Future getGetApiResponse(String url) async {
//     dynamic responseJson;
//     try {
//       final response = await http
//           .get(Uri.parse(url))
//           .timeout(Duration(seconds: 15));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }
//
//   @override
//   Future getPostApiResponse(String url, dynamic data) async {
//     dynamic responseJson;
//     try {
//       final response = await http.post(Uri.parse(url), body: jsonEncode(data),headers: {
//         'Content-Type': 'application/json',
//       },);
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }
//
//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       default:
//         throw FetchDataException(response.statusCode.toString());
//     }
//   }
// }
