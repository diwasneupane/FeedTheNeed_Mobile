import 'dart:io';

import 'package:dio/dio.dart';
import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/model/donate_model.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';

class DonateApi {
  Future<bool> donationData(DonateModel donateModel) async {
    bool isDonated = false;
    Response response;
    var url = baseUrl + donation;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
        data: donateModel.toJson(),
      );
      // debugPrint("askjd");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isDonated;
  }
}
