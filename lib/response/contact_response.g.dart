// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) {
  return ContactResponse(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>)
        .map((e) => e == null
            ? null
            : ContactUsData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
