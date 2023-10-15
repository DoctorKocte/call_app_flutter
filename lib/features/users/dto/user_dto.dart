import 'dart:developer';

class UserDTO {
  UserDTO({
    required this.id, 
    required this.username,
    this.firstName, 
    this.lastName, 
    this.phoneNumber,
    this.imageString
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    log('USER MODEL: $json');
    return UserDTO(
      id: json['_id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'],
      imageString: json['imageString']
    );
  }

  String id;
  String username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? imageString;
}
