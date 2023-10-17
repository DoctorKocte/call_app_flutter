import 'package:call_app/features/main/dto/contact_dto.dart';

class Contact {
  Contact({
    required this.id, 
    required this.isFavorite, 
    this.username,
    this.firstName, 
    this.lastName,
    this.imageString
  });

 //factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  //Map<String, dynamic> toJson() => _$UserDTOToJson(this);
  factory Contact.fromDTO({required ContactDTO dto}) {
    //log('USER MODEL: $json');
    return Contact(
      id: dto.id,
      username: dto.username,
      firstName: dto.firstName,
      lastName: dto.lastName,
      isFavorite: dto.isFavorite,
      imageString: dto.imageString
    );
  }

  String id;
  String? username;
  String? firstName;
  String? lastName;
  bool isFavorite;
  String? imageString;
}
