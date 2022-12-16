// import 'package:feedtheneed/model/Map.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donate_response.g.dart';

@JsonSerializable()
class DonateResponse {
  bool? success;
  // String? token;
  String? msg;

  DonateResponse({this.success, required this.msg});
  factory DonateResponse.fromJson(Map<String, dynamic> json) =>
      _$DonateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DonateResponseToJson(this);
}
