// import 'package:feedtheneed/model/Map.dart';
import 'package:feedtheneed/model/mapmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_response.g.dart';

@JsonSerializable()
class MapResponse {
  bool? success;
  // String? token;
  List<MapData?> data;

  MapResponse({this.success, required this.data});
  factory MapResponse.fromJson(Map<String, dynamic> json) =>
      _$MapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MapResponseToJson(this);
}
