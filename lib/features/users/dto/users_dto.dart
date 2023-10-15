import 'package:call_app/features/users/dto/user_dto.dart';

class UsersDTO {
  UsersDTO({required this.users});

  factory UsersDTO.fromJson(Map<String, dynamic> json) {
    final users = (json['users'] as List<dynamic>).map((userDTO) => UserDTO.fromJson(userDTO)).toList();
    return UsersDTO(
      users: users
    );
   }

   List<UserDTO> users;
}
