import 'package:feedtheneed/model/contact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse {
  bool? success;
  // String? token;
  List<ContactUsData?> data;

  ContactResponse({this.success, required this.data});
  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}
