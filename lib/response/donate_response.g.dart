// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateResponse _$DonateResponseFromJson(Map<String, dynamic> json) {
  return DonateResponse(
    success: json['success'] as bool?,
    msg: json['msg'] as String?,
  );
}

Map<String, dynamic> _$DonateResponseToJson(DonateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
    };
