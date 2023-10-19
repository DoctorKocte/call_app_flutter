import 'package:call_app/features/auth/models/token_model.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:call_app/services/token_service/entity/token_dto.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  AuthRepository({required this.requestService, required this.endpointConfig});

  final EndpointConfig endpointConfig;
  final RequestServiceProtocol requestService;

  Future<Either<String, TokenModel>> login(
      {required String username, required String password}) async {
    try {
      final responseData = await requestService.makeDataRequest(
          requestMethod: RequestMethod.post,
          path: endpointConfig.loginEndpoint,
          headers: {},
          data: {'username': username, 'password': password});

      if (responseData != null) {
        final tokenDTO = TokenDTO.fromJson(responseData);
        final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
        final tokenService = requestService.getTokenService();
        await tokenService.setTokens(
            tokenModel.accessToken, tokenModel.refreshToken);
        return Right(tokenModel);
      } else {
        return Left('data = null');
      }
    } on String catch (e) {
      return Left(e);
    }
  }

  Future<Either<String, TokenModel>> register(
      {required String username,
      required String password,
      required String phoneNumber,
      String? firstName,
      String? lastName}) async {
    try {
      final responseData = await requestService.makeDataRequest(
          requestMethod: RequestMethod.post,
          path: endpointConfig.registerEndpoint,
          headers: {},
          data: {
            'username': username,
            'password': password,
            'phoneNumber': phoneNumber,
            'firstName': firstName,
            'lastName': lastName
          });
      if (responseData != null) {
        final tokenDTO = TokenDTO.fromJson(responseData);
        final tokenModel = TokenModel.fromDTO(dto: tokenDTO);
        final tokenService = requestService.getTokenService();
        await tokenService.setTokens(
            tokenModel.accessToken, tokenModel.refreshToken);
        return Right(tokenModel);
      } else {
        return Left('data = null');
      }
    } on String catch (e) {
      return Left(e);
    }
  }
}
