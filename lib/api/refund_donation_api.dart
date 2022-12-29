// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/model/refund_model.dart';
import 'package:feedtheneed/response/refund_request_response.dart';
import 'package:feedtheneed/utils/api_url.dart';

class RefundRequestApi {
  Future<bool> getRefundRequest(RefundModel refundModel) async {
    Future.delayed(const Duration(seconds: 2), () {});
    RefundRequestResponse? refundRequestResponse;
    RefundModel? refundRequest;
    try {
      var dio = HttpServices().getDioInstance();

      Response response = await dio.post(
        baseUrl + refundrequest + refundModel.transaction_id!,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
        data: refundModel.toJson(),
      );

      if (response.data["msg"] == "Refund Request Already Sent") {
        return false;
      } else if (response.data["msg"] == "Refund Request Sent") {
        return true;
      }
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }
}
