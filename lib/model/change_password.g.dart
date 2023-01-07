// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) {
  return ChangePasswordModel(
    currentPassword: json['currentPassword'] as String?,
    newPassword: json['newPassword'] as String?,
    confirmNewPassword: json['confirmNewPassword'] as String?,
  );
}

Map<String, dynamic> _$ChangePasswordModelToJson(
        ChangePasswordModel instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
      'confirmNewPassword': instance.confirmNewPassword,
    };
