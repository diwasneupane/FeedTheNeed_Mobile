// import 'package:feedtheneed/model/Map.dart';
import 'package:feedtheneed/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leaderboard_response.g.dart';

@JsonSerializable()
class LeaderBoardResponse {
  bool? success;
  // String? token;
  List<UserProfile?> data;

  LeaderBoardResponse({this.success, required this.data});
  factory LeaderBoardResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderBoardResponseToJson(this);
}
