import 'package:call_app/features/auth/models/login_model.dart';
import 'package:call_app/features/auth/models/token_model.dart';
import 'package:call_app/network/api_error.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:call_app/services/token_service/entity/token_dto.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositoryProtocol {
  Future<Either<String, TokenModel>> login({required LoginModel loginModel});
  Future<Either<String, TokenModel>> register(
      {required RegisterModel registerModel});
}

class AuthRepository implements AuthRepositoryProtocol {
  AuthRepository({required this.requestService, required this.endpointConfig});

  final EndpointConfig endpointConfig;
  final RequestServiceProtocol requestService;

  @override
  Future<Either<String, TokenModel>> login(
      {required LoginModel loginModel}) async {
    try {
      final responseData = await requestService.makeDataRequest(
          requestMethod: RequestMethod.post,
          path: endpointConfig.loginEndpoint,
          headers: {},
          data: {
            'username': loginModel.username,
            'password': loginModel.password
          });

      return responseData.fold(Left.new, (r) async {
        if (r != null) {
          final tokenDTO = TokenDTO.fromJson(r);
          final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
          await requestService
              .getTokenService()
              .setTokens(tokenModel.accessToken, tokenModel.refreshToken);
          return Right(tokenModel);
        } else {
          return Left(ApiError.loadUser.errorString);
        }
      });

      // if (responseData != null) {
      //   final tokenDTO = TokenDTO.fromJson(responseData);
      //   final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
      //   final tokenService = requestService.getTokenService();
      //   await tokenService.setTokens(
      //       tokenModel.accessToken, tokenModel.refreshToken);
      //   return Right(tokenModel);
      // } else {
      //   return Left(ApiError.emptyResponse.errorString);
      // }
    } on String catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<String, TokenModel>> register(
      {required RegisterModel registerModel}) async {
    try {
      final responseData = await requestService.makeDataRequest(
          requestMethod: RequestMethod.post,
          path: endpointConfig.registerEndpoint,
          headers: {},
          data: {
            'username': registerModel.username,
            'password': registerModel.password,
            'phoneNumber': registerModel.phoneNumber,
            'firstName': registerModel.firstName,
            'lastName': registerModel.lastName
          });

      return responseData.fold(Left.new, (r) async {
        if (r != null) {
          final tokenDTO = TokenDTO.fromJson(r);
          final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
          await requestService
              .getTokenService()
              .setTokens(tokenModel.accessToken, tokenModel.refreshToken);
          return Right(tokenModel);
        } else {
          return Left(ApiError.loadUser.errorString);
        }
      });
      // if (responseData != null) {
      //   final tokenDTO = TokenDTO.fromJson(responseData);
      //   final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
      //   final tokenService = requestService.getTokenService();
      //   await tokenService.setTokens(
      //       tokenModel.accessToken, tokenModel.refreshToken);
      //   return Right(tokenModel);
      // } else {
      //   return Left(ApiError.emptyResponse.errorString);
      // }
    } on String catch (e) {
      return Left(e);
    }
  }
}
