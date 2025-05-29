// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PersonalInfoModel {
  final String email;
  final String phoneNumber;
  final String location;
  final String bio;
  final String instagramUsername;

  PersonalInfoModel({
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.bio,
    required this.instagramUsername,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phoneNumber': phoneNumber,
      'location': location,
      'bio': bio,
      'instagramUsername': instagramUsername,
    };
  }

  factory PersonalInfoModel.fromMap(Map<String, dynamic> map) {
    return PersonalInfoModel(
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      location: map['location'] as String,
      bio: map['bio'] as String,
      instagramUsername: map['instagramUsername'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalInfoModel.fromJson(String source) =>
      PersonalInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
