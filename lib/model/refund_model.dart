// ignore: depend_on_referenced_packages
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'refund_model.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class RefundModel {
  String? user_id;
  String? transaction_id;
  String? feedback;
  String? refund_reason;

  RefundModel({
    this.user_id,
    this.transaction_id,
    this.feedback,
    this.refund_reason,
  });

  factory RefundModel.fromJson(Map<String, dynamic> json) =>
      _$RefundModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefundModelToJson(this);
}
