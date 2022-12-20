// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapData _$MapDataFromJson(Map<String, dynamic> json) {
  return MapData(
    id: json['_id'] as String?,
    lat: json['lat'] as String?,
    long: json['long'] as String?,
  );
}

Map<String, dynamic> _$MapDataToJson(MapData instance) => <String, dynamic>{
      '_id': instance.id,
      'lat': instance.lat,
      'long': instance.long,
    };
