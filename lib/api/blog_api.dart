import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/model/blog.dart';
import 'package:feedtheneed/response/single_blog_response.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';

class BlogAPI {
  Future<List<dynamic>> getBlogs() async {
    // Future.delayed(const Duration(seconds: 5), () {});
    List<dynamic> blogList = [];

    try {
      var dio = HttpServices().getDioInstance();
      dio.interceptors
          .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
      Response response = await dio.get(
        baseUrl + blog,
      );
      // debugPrint(response.data.length.toString());
      if (response.statusCode == 201) {
        // debugPrint(response.data.toString());

        for (var data in response.data!) {
          blogList.add(data);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return blogList;
  }

  Future<Blog?> getSingleBlogs(String blogid) async {
    Future.delayed(const Duration(seconds: 2), () {});
    SingleBlogResponse? singleblogResponse;
    Blog? blogModel;
    try {
      var dio = HttpServices().getDioInstance();

      Response response = await dio.get(baseUrl + blog + blogid);

      if (response.statusCode == 201) {
        // debugPrint(response.data.toString());
        singleblogResponse = SingleBlogResponse.fromJson(response.data);
        blogModel = Blog(
          id: singleblogResponse.data!.id,
          blog_name: singleblogResponse.data!.blog_name,
          short_desc: singleblogResponse.data!.short_desc,
          blog_desc: singleblogResponse.data!.blog_desc,
          blog_category: singleblogResponse.data!.blog_category,
          blog_price: singleblogResponse.data!.blog_price,
          blog_image: singleblogResponse.data!.blog_image,
          donor_name: singleblogResponse.data!.donor_name,
          donor_image: singleblogResponse.data!.donor_image,
        );
      } else {
        blogModel = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return blogModel;
  }
}
