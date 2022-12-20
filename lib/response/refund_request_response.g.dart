// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundRequestResponse _$RefundRequestResponseFromJson(
    Map<String, dynamic> json) {
  return RefundRequestResponse(
    success: json['success'] as bool?,
    msg: json['msg'] as String?,
  );
}

Map<String, dynamic> _$RefundRequestResponseToJson(
        RefundRequestResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
    };
