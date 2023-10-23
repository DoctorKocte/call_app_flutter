import 'package:call_app/network/api_error.dart';
import 'package:call_app/network/api_response_model.dart';
import 'package:call_app/services/token_service/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

enum RequestMethod {
  get,
  post;
}

abstract class RequestServiceProtocol {
  TokenService getTokenService();

  Future<Either<String, Map<String, dynamic>?>> makeDataRequest(
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
  TokenService getTokenService() {
    return tokenService;
  }

  @override
  Future<Either<String, Map<String, dynamic>?>> makeDataRequest(
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
      sendTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60)
    );
    
    try {
      Response<dynamic> response;

      switch (requestMethod) {
        case RequestMethod.get:
          response = await dio.get(path, options: options, data: data);
        case RequestMethod.post:
          response = await dio.post(path, options: options, data: data);
      }

      final responseData = ApiResponse.parseBody(response.data);
      if (responseData.success) {
        return Right(responseData.data);
      } else {
        return Left(ApiError.emptyResponse.errorString);
      }
    } on DioException catch (e) {
      if(e.type == DioExceptionType.connectionTimeout) {
        return Left(ApiError.timeout.errorString);
      }
      return Left(e.toString());
    }
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
      return null;
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
