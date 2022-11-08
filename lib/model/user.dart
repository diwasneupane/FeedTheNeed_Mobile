// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class User {
  String? email;

  String? phone;
  String? username;
  String? password;
  String? address;
  String? firstname;
  String? lastname;
  String? dob;
  String? otp;

  User({
    this.email,
    this.phone,
    this.username,
    this.password,
    this.address,
    this.firstname,
    this.lastname,
    this.otp,
    this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
