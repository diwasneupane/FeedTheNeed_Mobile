// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateModel _$DonateModelFromJson(Map<String, dynamic> json) {
  return DonateModel(
    donation_amount: json['donation_amount'] as int?,
    donation_category: json['donation_category'] as String?,
    donor_name: json['donor_name'] as String?,
    donor_note: json['donor_note'] as String?,
    donor_address: json['donor_address'] as String?,
    idx: json['idx'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$DonateModelToJson(DonateModel instance) =>
    <String, dynamic>{
      'donation_amount': instance.donation_amount,
      'donation_category': instance.donation_category,
      'donor_name': instance.donor_name,
      'donor_note': instance.donor_note,
      'donor_address': instance.donor_address,
      'idx': instance.idx,
      'token': instance.token,
    };
