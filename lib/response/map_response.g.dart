// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapResponse _$MapResponseFromJson(Map<String, dynamic> json) {
  return MapResponse(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : MapData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MapResponseToJson(MapResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
