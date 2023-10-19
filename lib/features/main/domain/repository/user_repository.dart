import 'package:call_app/features/users/dto/user_dto.dart';
import 'package:call_app/features/users/models/user_model.dart';
import 'package:call_app/network/request_service.dart';
import 'package:call_app/services/endpoint_config.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  UserRepository({required this.requestService, required this.endpointConfig});

  final EndpointConfig endpointConfig;
  final RequestServiceProtocol requestService;

  Future<Either<String, User>> getUserData() async {
 
    try {
    final responseData = await requestService.makeAuthorizedRequest(
      requestMethod: RequestMethod.get,
      path: endpointConfig.userDataEndpoint, 
      headers: <String, dynamic>{}, 
      data: {}
    );

    if (responseData != null) {
        final userDTO = UserDTO.fromJson(responseData['user']);
        final user = User.fromDTO(dto: userDTO);
        return Right(user);
      } else {
        return throw Exception('Failed to load user: data null');
      } 
    } on String catch (e) {
      return Left(e);
    }
  }

  Future<Either<String, void>> changeProfileImage({required String imageString}) async {
    try {
    final responseData = await requestService.makeSuccessAuthorizedRequest(
      requestMethod: RequestMethod.post,
      path: endpointConfig.changeProfileImageEndpoint, 
      headers: <String, dynamic>{}, 
      data: {'imageString': imageString}
    );

    if (responseData.success) {
        return Right(());
      } else {
        return Left('error load image');
      } 
    } on String catch (e) {
      return Left(e);
    }
  }
}
