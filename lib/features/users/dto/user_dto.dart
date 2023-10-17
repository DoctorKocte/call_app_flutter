import 'package:call_app/features/main/dto/contact_dto.dart';
import 'package:json_annotation/json_annotation.dart';
//part 'user_dto.g.dart';

//@JsonSerializable()
class UserDTO {
  UserDTO({
    required this.id, 
    this.username,
    this.firstName, 
    this.lastName, 
    this.phoneNumber,
    this.imageString,
    required this.contacts
  });

 //factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  //Map<String, dynamic> toJson() => _$UserDTOToJson(this);
  factory UserDTO.fromJson(Map<String, dynamic> json) {
    //log('USER MODEL: $json');
    return UserDTO(
      id: json['_id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'],
      imageString: json['imageString'],
      contacts: (json['contacts'] as List<dynamic>).map((contactDTO) => ContactDTO.fromJson(contactDTO)).toList()
    );
  }

  String id;
  String? username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? imageString;
  List<ContactDTO> contacts;
}
