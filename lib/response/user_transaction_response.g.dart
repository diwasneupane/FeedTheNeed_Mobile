// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTransactionResponse _$UserTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return UserTransactionResponse(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>)
        .map((e) => e == null
            ? null
            : UserTransaction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserTransactionResponseToJson(
        UserTransactionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
