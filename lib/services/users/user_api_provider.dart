import 'dart:convert';
import 'dart:developer';

import 'package:call_app/features/users/dto/user_dto.dart';
import 'package:call_app/features/users/dto/users_dto.dart';
import 'package:call_app/features/users/models/user_model.dart';
import 'package:call_app/features/users/models/users_model.dart';
import 'package:call_app/services/api_response_model.dart';
import 'package:call_app/services/auth/auth_provider.dart';
import 'package:call_app/services/endpoint_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  EndpointConfig endpointConfig = EndpointConfig();

  Future<Either<String, Users>> getUsers() async {
    final response = await http.get(Uri.parse(endpointConfig.getUsersEndpoint));
    log('${endpointConfig.getUsersEndpoint} ====> ${response.body}');

    final usersData = ApiResponse.parseBody(json.decode(response.body));
    if (usersData.success) {
      if (usersData.data != null) {
        final usersDTO = UsersDTO.fromJson(usersData.data!);
        final usersList = Users.fromDTO(usersDTO);
        return Right(usersList);
      } else {
        return Right(Users(users: []));
      }
    } else {
      return Left(usersData.message ?? 'Error fetching users');
    } 
  }

  Future<Either<String, User>> getUserData() async {
     final dio = Dio();

    final response = await http.get(
      Uri.parse(endpointConfig.userDataEndpoint),
      headers: {
         'content-Type': 'application/json',
              'accept': 'application/json',
              'authorization': 'Bearer $token'
      }
    );

    //  final response = await dio.get(endpointConfig.userDataEndpoint, 
    //   options: Options(
    //         headers: {
    //           'content-Type': 'application/json',
    //           'accept': 'application/json',
    //           'authorization': 'Bearer $token'
    //         },
    //       ),
    //  );

     log('${endpointConfig.userDataEndpoint} ====> ${response.body}'); 
print(json.decode(response.body));
    final resp = json.decode(response.body);
    final Map<String, dynamic> temp = json.decode(resp['data']);
    final responseData = ApiResponse.parseBody(json.decode(temp['user']));
    if (responseData.success) {
      if (responseData.data != null) {
      final userDTO = UserDTO.fromJson(responseData.data!['user']);
      final user = User.fromDTO(dto: userDTO);
      return Right(user);
    } else {
      return throw Exception('Failed to load user: data null');
    }
    } else {
      throw Exception('Failed to load user');
    }
  }
}
