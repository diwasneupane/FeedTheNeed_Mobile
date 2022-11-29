// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'partner_model.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class PartnerModel {
  @JsonKey(name: '_id')
  String? id;
  String? partner_name;
  String? partner_category;
  String? partner_image;
  String? banner_image;

  PartnerModel({
    this.partner_name,
    this.partner_category,
    this.partner_image,
    this.banner_image,
  });
  factory PartnerModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerModelToJson(this);
}
