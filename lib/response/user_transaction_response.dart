// import 'package:feedtheneed/model/Map.dart';
import 'package:feedtheneed/model/user_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_transaction_response.g.dart';

@JsonSerializable()
class UserTransactionResponse {
  bool? success;
  // String? token;
  List<UserTransaction?> data;

  UserTransactionResponse({this.success, required this.data});
  factory UserTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserTransactionResponseToJson(this);
}
