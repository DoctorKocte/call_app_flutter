import 'package:call_app/features/main/dto/user_dto.dart';
import 'package:call_app/features/main/models/user_model.dart';
import 'package:call_app/network/api_error.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositoryProtocol {
  Future<Either<String, User>> getUserData();
  Future<Either<String, void>> changeProfileImage({required String imageString});
}

class UserRepository implements UserRepositoryProtocol {
  UserRepository({required this.requestService, required this.endpointConfig});

  final EndpointConfig endpointConfig;
  final RequestServiceProtocol requestService;

  @override
  Future<Either<String, User>> getUserData() async {
    try {
      final responseData = await requestService.makeAuthorizedRequest(
          requestMethod: RequestMethod.get,
          path: endpointConfig.userDataEndpoint,
          headers: <String, dynamic>{},
          data: {});

      if (responseData != null) {
        final userDTO = UserDTO.fromJson(responseData['user']);
        final user = User.fromDTO(dto: userDTO);
        return Right(user);
      } else {
        return Left(ApiError.loadUser.errorString);
      }
    } on String catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<String, void>> changeProfileImage(
      {required String imageString}) async {
    try {
      final responseData = await requestService.makeSuccessAuthorizedRequest(
          requestMethod: RequestMethod.post,
          path: endpointConfig.changeProfileImageEndpoint,
          headers: <String, dynamic>{},
          data: {'imageString': imageString});

      if (responseData.success) {
        return const Right(());
      } else {
        return Left(ApiError.loadImage.errorString);
      }
    } on String catch (e) {
      return Left(e);
    }
  }
}
