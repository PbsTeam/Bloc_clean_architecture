import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../utils/exceptions/exceptions.dart';
import 'base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiServices {
  @override
  Future getApiService({required String url}) async {
    dynamic jsonResponse;
    try {
      apiHitUrl(url: url);

      final response = await http.get(Uri.parse(url));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException();
    }

    return jsonResponse;
  }

  @override
  Future postApiService({required String url, required Map data}) async {
    dynamic jsonResponse;

    var header = {'x-api-key': 'reqres-free-v1'};
    apiHitUrl(url: url, header: header);

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: header,
      );

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException();
    }
    return jsonResponse;
  }

  /// Handel Api Response

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 401:
        throw UnAuthorizedException();

      case 500:
        throw FetchDataException();

      default:
    }
  }

  void apiHitUrl({required String url, Map? header}) {
    log('Api :$url\n Header:$header');
  }
}
