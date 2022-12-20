// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsData _$ContactUsDataFromJson(Map<String, dynamic> json) {
  return ContactUsData(
    id: json['_id'] as String?,
    company_phone: json['company_phone'] as String?,
    company_address: json['company_address'] as String?,
    company_name: json['company_name'] as String?,
    company_founded: json['company_founded'] as String?,
  );
}

Map<String, dynamic> _$ContactUsDataToJson(ContactUsData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'company_name': instance.company_name,
      'company_phone': instance.company_phone,
      'company_address': instance.company_address,
      'company_founded': instance.company_founded,
    };
