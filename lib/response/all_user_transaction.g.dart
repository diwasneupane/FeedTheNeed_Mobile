// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_user_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUserTransactionResponse _$AllUserTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return AllUserTransactionResponse(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>)
        .map((e) => e == null
            ? null
            : AllUserTransaction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllUserTransactionResponseToJson(
        AllUserTransactionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
