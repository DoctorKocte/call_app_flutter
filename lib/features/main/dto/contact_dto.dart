// public struct ContactDTO {
//     public let id: String
//     public let firstName: String?
//     public let lastName: String?
//     public let username: String
//     public let imageString: String?
//     public let isFavorite: Bool
// }

// extension ContactDTO: Codable {
//     enum CodingKeys: String, CodingKey {
//         case id = "_id"
//         case firstName
//         case lastName
//         case username
//         case imageString
//         case isFavorite
//     }
// }

class ContactDTO {
  ContactDTO({
    required this.id, 
    this.username,
    this.firstName, 
    this.lastName, 
    required this.isFavorite,
    this.imageString
  });

 //factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  //Map<String, dynamic> toJson() => _$UserDTOToJson(this);
  factory ContactDTO.fromJson(Map<String, dynamic> json) {
    //log('USER MODEL: $json');
    return ContactDTO(
      id: json['_id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'] ?? '',
      isFavorite: json['isFavorite'],
      imageString: json['imageString']
    );
  }

  String id;
  String? username;
  String? firstName;
  String? lastName;
  bool isFavorite;
  String? imageString;
}
