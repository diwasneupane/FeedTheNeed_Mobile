// ignore: depend_on_referenced_packages

// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'donate_model.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class DonateModel {
  int? donation_amount;
  String? donation_category;
  String? donor_name;
  String? donor_note;
  String? donor_address;
  String? idx;
  String? token;

  DonateModel({
    this.donation_amount,
    this.donation_category,
    this.donor_name,
    this.donor_note,
    this.donor_address,
    this.idx,
    this.token,
  });

  factory DonateModel.fromJson(Map<String, dynamic> json) =>
      _$DonateModelFromJson(json);

  Map<String, dynamic> toJson() => _$DonateModelToJson(this);
}
