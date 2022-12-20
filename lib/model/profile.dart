// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part '../api/profile.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class UserProfile {
  @JsonKey(name: '_id')
  String? user_id;
  String? email;
  String? firstname;
  String? lastname;

  String? phone;
  String? username;
  String? password;
  String? address;
  String? picture;
  String? dob;
  double? donation_point;
  // int? age;

  UserProfile({
    this.user_id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.address,
    // this.age,
    this.picture,
    this.dob,
    this.donation_point,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
