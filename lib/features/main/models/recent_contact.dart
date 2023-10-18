import 'package:call_app/features/main/dto/recent_contact_dto.dart';
import 'package:call_app/features/main/models/contact.dart';

class RecentContact {
  RecentContact({
    required this.date, 
    required this.contact
  });

  factory RecentContact.fromDTO({required RecentContactDTO dto}) {
    return RecentContact(
      date: dto.date,
      contact: Contact.fromDTO(dto: dto.contactDTO)
    );
  }

  DateTime date;
  Contact contact;
}
