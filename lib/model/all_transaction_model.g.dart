// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUserTransaction _$AllUserTransactionFromJson(Map<String, dynamic> json) {
  return AllUserTransaction(
    id: json['_id'] as String?,
    user_id: json['user_id'] == null
        ? null
        : UserProfile.fromJson(json['user_id'] as Map<String, dynamic>),
    donation_amount: json['donation_amount'] as int?,
    donation_category: json['donation_category'] as String?,
    donor_name: json['donor_name'] as String?,
    donor_note: json['donor_note'] as String?,
    donor_address: json['donor_address'] as String?,
    idx: json['idx'] as String?,
    token: json['token'] as String?,
    created_at: json['created_at'] as String?,
    donation_status: json['donation_status'] as String?,
  );
}

Map<String, dynamic> _$AllUserTransactionToJson(AllUserTransaction instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.user_id,
      'donation_amount': instance.donation_amount,
      'donation_category': instance.donation_category,
      'donor_name': instance.donor_name,
      'donor_note': instance.donor_note,
      'donor_address': instance.donor_address,
      'idx': instance.idx,
      'token': instance.token,
      'created_at': instance.created_at,
      'donation_status': instance.donation_status,
    };
