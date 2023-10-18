import 'package:call_app/features/main/dto/contact_dto.dart';

class Contact {
  Contact({
    required this.id, 
    required this.isFavorite, 
    this.username,
    this.firstName, 
    this.lastName,
    this.imageString,
    this.notice
  });

  factory Contact.fromDTO({required ContactDTO dto}) {
    return Contact(
      id: dto.id,
      username: dto.username,
      firstName: dto.firstName,
      lastName: dto.lastName,
      isFavorite: dto.isFavorite,
      imageString: dto.imageString,
      notice: dto.notice
    );
  }

  String id;
  String? username;
  String? firstName;
  String? lastName;
  bool isFavorite;
  String? imageString;
  String? notice;
}
