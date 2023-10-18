import 'package:call_app/features/main/dto/contact_dto.dart';
import 'package:call_app/features/main/dto/recent_contact_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  UserDTO({
    required this.id, 
    required this.contacts, 
    required this.recentContacts, 
    this.username,
    this.firstName, 
    this.lastName, 
    this.phoneNumber,
    this.imageString
  });

 factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  @JsonKey(
    name: '_id'
  )
  String id;
  String? username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? imageString;
  List<ContactDTO> contacts;
  List<RecentContactDTO> recentContacts;
}
