// import 'package:feedtheneed/model/Map.dart';
import 'package:feedtheneed/model/all_transaction_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_user_transaction.g.dart';

@JsonSerializable()
class AllUserTransactionResponse {
  bool? success;
  // String? token;
  List<AllUserTransaction?> data;

  AllUserTransactionResponse({this.success, required this.data});
  factory AllUserTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUserTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllUserTransactionResponseToJson(this);
}
