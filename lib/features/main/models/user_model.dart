import 'dart:convert';

import 'package:call_app/features/main/dto/user_dto.dart';
import 'package:call_app/features/main/models/contact.dart';
import 'package:call_app/features/main/models/recent_contact.dart';
import 'package:flutter/material.dart';

class User {
  User({
    required this.id, 
    required this.username,
    required this.firstName, 
    required this.lastName, 
    required this.contacts,
    required this.recentContacts,
    required this.imageString,
    this.profileImage, 
    this.phoneNumber
  });

  factory User.fromDTO({required UserDTO dto}) {
    return User(
        id: dto.id,
        username: dto.username,
        firstName: dto.firstName ?? '',
        lastName: dto.lastName ?? '',
        phoneNumber: dto.phoneNumber,
        imageString: dto.imageString ?? '',
        profileImage: (dto.imageString != null) ? Image.memory(base64Decode(dto.imageString!), fit: BoxFit.fill) : null,
        contacts: dto.contacts.map((contactDTO) => Contact.fromDTO(dto: contactDTO)).toList(),
        recentContacts: dto.recentContacts.map((recentContactDTO) => RecentContact.fromDTO(dto: recentContactDTO)).toList()
    );
  }

  String id;
  String? username;
  String firstName;
  String lastName;
  String? phoneNumber;
  String imageString;
  Image? profileImage;
  List<Contact> contacts;
  List<RecentContact> recentContacts;
}
