import 'dart:io';

import 'package:dio/dio.dart';
import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/model/change_password.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';

class ChangePasswordApi {
  Future<List<dynamic>> changePassword(
      ChangePasswordModel changePasswordModel) async {
    List<dynamic> changePasswordList = [];
    bool isChangePassword = false;
    Response response;
    var url = baseUrl + changepassword;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
        data: changePasswordModel.toJson(),
      );
      if (response.data["msg"] == "Password successfully updated!") {
        changePasswordList = [true, response.data["msg"]];
        return changePasswordList;
      } else if (response.data["msg"] == "New passwords do not match") {
        changePasswordList = [false, response.data["msg"]];
        return changePasswordList;
      } else if (response.data["msg"] ==
          "Password should be at least six characters") {
        changePasswordList = [false, response.data["msg"]];
        return changePasswordList;
      } else if (response.data["msg"] == "New Password Cannot Be Same To Old") {
        changePasswordList = [false, response.data["msg"]];
        return changePasswordList;
      } else if (response.data["msg"] == "Current password is not a match") {
        changePasswordList = [false, response.data["msg"]];
        return changePasswordList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return changePasswordList;
  }
}
