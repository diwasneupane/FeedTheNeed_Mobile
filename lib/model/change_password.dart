// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'change_password.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class ChangePasswordModel {
  String? currentPassword;
  String? newPassword;
  String? confirmNewPassword;

  ChangePasswordModel({
    this.currentPassword,
    this.newPassword,
    this.confirmNewPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}
