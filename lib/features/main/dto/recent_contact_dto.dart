import 'package:call_app/features/main/dto/contact_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'recent_contact_dto.g.dart';

@JsonSerializable()
class RecentContactDTO {
  RecentContactDTO({
    required this.date, 
    required this.contactDTO
  });

  factory RecentContactDTO.fromJson(Map<String, dynamic> json) => _$RecentContactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecentContactDTOToJson(this);

  DateTime date;
  ContactDTO contactDTO;
}
