import 'package:json_annotation/json_annotation.dart';
part 'contact_dto.g.dart';

@JsonSerializable()
class ContactDTO {
  ContactDTO({
    required this.id, 
    required this.isFavorite, 
    this.username,
    this.firstName, 
    this.lastName,
    this.imageString,
    this.notice
  });

  factory ContactDTO.fromJson(Map<String, dynamic> json) => _$ContactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDTOToJson(this);

@JsonKey(name: '_id')
  String id;
  String? username;
  String? firstName;
  String? lastName;
  bool isFavorite;
  String? imageString;
  String? notice;
}
