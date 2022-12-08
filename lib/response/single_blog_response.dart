// ignore_for_file: non_constant_identifier_names

import 'package:feedtheneed/model/blog.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_blog_response.g.dart';

@JsonSerializable()
class SingleBlogResponse {
  bool? success;
  Blog? data;
  SingleBlogResponse({this.success, this.data});

  factory SingleBlogResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleBlogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleBlogResponseToJson(this);
}
