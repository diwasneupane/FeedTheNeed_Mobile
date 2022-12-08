// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
class Blog {
  @JsonKey(name: '_id')
  String? id;
  String? blog_name;
  String? short_desc;
  String? blog_desc;
  String? blog_category;
  int? blog_price;
  String? blog_image;
  String? donor_name;
  String? donor_image;

  Blog(
      {this.id,
      this.blog_name,
      this.short_desc,
      this.blog_desc,
      this.blog_category,
      this.blog_image,
      this.blog_price,
      this.donor_image,
      this.donor_name});

  //1. flutter clean
  //2. flutter pub get

//3. flutter pub run build_runner build
  factory Blog.fromJson(Map<String, dynamic> json) {
    return _$BlogFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlogToJson(this);

  getSingleBlogs() {}
}
