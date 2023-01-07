// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleBlogResponse _$SingleBlogResponseFromJson(Map<String, dynamic> json) {
  return SingleBlogResponse(
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : Blog.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleBlogResponseToJson(SingleBlogResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
