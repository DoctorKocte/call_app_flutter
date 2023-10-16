import 'dart:convert';
import 'dart:developer';

import 'package:call_app/features/auth/dto/token_dto.dart';
import 'package:call_app/features/auth/models/token_model.dart';
import 'package:call_app/services/api_response_model.dart';
import 'package:call_app/services/endpoint_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  EndpointConfig endpointConfig = EndpointConfig();

  Future<Either<String, TokenModel>> login({required String username, required String password}) async {
    log('login pressed');
    final response = await http.post(
      Uri.parse(endpointConfig.loginEndpoint),
      body: {'username': username, 'password': password}
    );
    log('${endpointConfig.loginEndpoint} ====> ${response.body}');
    final tokenData = ApiResponse.parseBody(json.decode(response.body));

    if (tokenData.success) {
      if (tokenData.data != null) {
        final tokenDTO = TokenDTO.fromJson(tokenData.data!);
        final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
        return Right(tokenModel);
      } else {
        return const Left('Error login');
      }
    } else {
      return Left(tokenData.message ?? 'Error login: success: false');
    }
  }

   Future<Either<String, TokenModel>> register({
    required String username,
    required String password, 
    required String phoneNumber,
    String? firstName,
    String? lastName
  }) async {
    final dio = Dio();

    // final response = await http.post(
    //   Uri.parse(endpointConfig.registerEndpoint),
    //   body: {
    //     'username': username, 
    //     'password': password,
    //     'phoneNumber': phoneNumber,
    //     'firstName': firstName,
    //     'lastName': lastName
    //   }
    // );

  final response = await dio.post(endpointConfig.registerEndpoint, data: {
        'username': username, 
        'password': password,
        'phoneNumber': phoneNumber,
        'firstName': firstName,
        'lastName': lastName
      });
    log('${endpointConfig.registerEndpoint} ====> ${response.data}');
    final tokenData = ApiResponse.parseBody(json.decode(response.data));

    if (tokenData.success) {
      if (tokenData.data != null) {
        final tokenDTO = TokenDTO.fromJson(tokenData.data!);
        final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
        return Right(tokenModel);
      } else {
        return const Left('Error login');
      }
    } else {
      return Left(tokenData.message ?? 'Error register: success: false');
    }
  }
}
