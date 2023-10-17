import 'package:call_app/features/main/models/contact.dart';
import 'package:call_app/features/users/dto/user_dto.dart';

class User {
  User({
    required this.id, 
    required this.firstName, 
    required this.lastName, 
    required this.contacts,
    this.phoneNumber,
    this.imageString
  });

  factory User.fromDTO({required UserDTO dto}) {
    return User(
        id: dto.id,
        firstName: dto.firstName ?? '', 
        //?? dto.username,
        lastName: dto.lastName ?? '',
        phoneNumber: dto.phoneNumber,
        imageString: dto.imageString,
        contacts: dto.contacts.map((contactDTO) => Contact.fromDTO(dto: contactDTO)).toList()
    );
  }

  String id;
  String firstName;
  String lastName;
  String? phoneNumber;
  String? imageString;
  List<Contact> contacts;
}
