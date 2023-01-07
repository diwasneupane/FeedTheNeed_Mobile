// ignore: depend_on_referenced_packages
// ignore_for_file: non_constant_identifier_names

import 'package:feedtheneed/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_transaction.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class UserTransaction {
  @JsonKey(name: '_id')
  String? id;

  String? user_id;
  int? donation_amount;
  String? donation_category;
  String? donor_name;
  String? donor_note;
  String? donor_address;
  String? idx;
  String? token;
  String? created_at;
  String? donation_status;

  UserTransaction({
    this.id,
    this.user_id,
    this.donation_amount,
    this.donation_category,
    this.donor_name,
    this.donor_note,
    this.donor_address,
    this.idx,
    this.token,
    this.created_at,
    this.donation_status,
  });

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$UserTransactionToJson(this);
}
