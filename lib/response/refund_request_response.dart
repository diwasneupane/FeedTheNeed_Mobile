// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'refund_request_response.g.dart';

@JsonSerializable()
class RefundRequestResponse {
  bool? success;
  String? msg;

  RefundRequestResponse({this.success, this.msg});

  factory RefundRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefundRequestResponseToJson(this);
}
