import 'dart:convert';
import 'dart:developer';

import 'package:call_app/features/users/dto/users_dto.dart';
import 'package:call_app/features/users/models/users_model.dart';
import 'package:call_app/services/api_response_model.dart';
import 'package:call_app/services/endpoint_config.dart';
import 'package:dartz/dartz.dart';
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
}
