// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardResponse _$LeaderBoardResponseFromJson(Map<String, dynamic> json) {
  return LeaderBoardResponse(
    success: json['success'] as bool?,
    data: (json['data'] as List<dynamic>)
        .map((e) =>
            e == null ? null : UserProfile.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LeaderBoardResponseToJson(
        LeaderBoardResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
