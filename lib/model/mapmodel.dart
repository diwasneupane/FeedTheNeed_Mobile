import 'package:json_annotation/json_annotation.dart';

part 'mapmodel.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class MapData {
  @JsonKey(name: '_id')
  String? id;
  String? lat;
  String? long;

  MapData({
    this.id,
    this.lat,
    this.long,
  });
  factory MapData.fromJson(Map<String, dynamic> json) =>
      _$MapDataFromJson(json);

  Map<String, dynamic> toJson() => _$MapDataToJson(this);
}
