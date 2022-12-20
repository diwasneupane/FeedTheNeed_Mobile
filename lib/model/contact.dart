// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class ContactUsData {
  @JsonKey(name: '_id')
  String? id;
  String? company_name;
  String? company_phone;
  String? company_address;
  String? company_founded;

  ContactUsData({
    this.id,
    this.company_phone,
    this.company_address,
    this.company_name,
    this.company_founded,
  });

  factory ContactUsData.fromJson(Map<String, dynamic> json) =>
      _$ContactUsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsDataToJson(this);
}
