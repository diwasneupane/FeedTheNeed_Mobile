// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    user_id: json['_id'] as String?,
    firstname: json['firstname'] as String?,
    lastname: json['lastname'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    address: json['address'] as String?,
    picture: json['picture'] as String?,
    dob: json['dob'] as String?,
    donation_point: (json['donation_point'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      '_id': instance.user_id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'address': instance.address,
      'picture': instance.picture,
      'dob': instance.dob,
      'donation_point': instance.donation_point,
    };
