import 'dart:developer';

import 'package:call_app/services/api_response_model.dart';
import 'package:call_app/services/token_service/token_service.dart';
import 'package:dio/dio.dart';

enum RequestMethod {
  get,
  post;
}

abstract class RequestServiceProtocol {
  TokenService getTokenService();

  Future<Map<String, dynamic>?> makeDataRequest(
      {required RequestMethod requestMethod,
      required String path,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data});

  Future<Map<String, dynamic>?> makeAuthorizedRequest(
      {required RequestMethod requestMethod,
      required String path,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data});

  Future<SuccessApiResponse> makeSuccessAuthorizedRequest(
      {required RequestMethod requestMethod,
      required String path,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data});
}

class RequestService implements RequestServiceProtocol {
  RequestService({required this.tokenService});

  final dio = Dio();
  final TokenService tokenService;

  @override
  TokenService getTokenService() { return tokenService; }

  @override
  Future<Map<String, dynamic>?> makeDataRequest(
      {required RequestMethod requestMethod,
      required String path,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
    final customHeaders = <String, dynamic>{
      'Content-Type': 'application/json',
      'accept': 'application/json',
    }..addAll(headers);

    final options = Options(
      headers: customHeaders,
    );

    Response<dynamic> response;

    switch (requestMethod) {
      case RequestMethod.get:
        response = await dio.get(path, options: options, data: data);
      case RequestMethod.post:
        response = await dio.post(path, options: options, data: data);
    }

    final responseData = ApiResponse.parseBody(response.data);
    return responseData.data;
  }

  @override
  Future<Map<String, dynamic>?> makeAuthorizedRequest(
      {required RequestMethod requestMethod,
      required String path,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {

    final customHeaders = <String, dynamic>{
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer ${tokenService.accessToken}'
    }..addAll(headers);

    final options = Options(
      headers: customHeaders,
    );

    Response<dynamic> response;

    switch (requestMethod) {
      case RequestMethod.get:
        response = await dio.get(path, options: options, data: data);
      case RequestMethod.post:
        response = await dio.post(path, options: options, data: data);
    }

    final responseData = ApiResponse.parseBody(response.data);
    if (responseData.success) {
      return responseData.data;
    } else {
      log('error');
    }
  }

    @override
  Future<SuccessApiResponse> makeSuccessAuthorizedRequest(
      {required RequestMethod requestMethod,
      required String path,
      required Map<String, dynamic> headers,
      required Map<String, dynamic> data}) async {
        
    final customHeaders = <String, dynamic>{
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer ${tokenService.accessToken}'
    }..addAll(headers);

    final options = Options(
      headers: customHeaders,
    );

    Response<dynamic> response;

    switch (requestMethod) {
      case RequestMethod.get:
        response = await dio.get(path, options: options, data: data);
      case RequestMethod.post:
        response = await dio.post(path, options: options, data: data);
    }

    final responseData = SuccessApiResponse.parseBody(response.data);
    return responseData;
  }
}
