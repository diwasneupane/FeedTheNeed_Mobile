// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    address: json['address'] as String?,
    firstname: json['firstname'] as String?,
    lastname: json['lastname'] as String?,
    otp: json['otp'] as String?,
    dob: json['dob'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'address': instance.address,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'dob': instance.dob,
      'otp': instance.otp,
    };
