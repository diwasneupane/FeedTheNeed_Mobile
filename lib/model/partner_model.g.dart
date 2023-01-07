// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerModel _$PartnerModelFromJson(Map<String, dynamic> json) {
  return PartnerModel(
    partner_name: json['partner_name'] as String?,
    partner_category: json['partner_category'] as String?,
    partner_image: json['partner_image'] as String?,
    banner_image: json['banner_image'] as String?,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$PartnerModelToJson(PartnerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'partner_name': instance.partner_name,
      'partner_category': instance.partner_category,
      'partner_image': instance.partner_image,
      'banner_image': instance.banner_image,
    };
