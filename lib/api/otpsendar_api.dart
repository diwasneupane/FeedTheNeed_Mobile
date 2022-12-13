import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';

class OtpApi {
  Future<bool> Otp(String email) async {
    bool isOtp = false;

    try {
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(
        baseUrl + otpsender,
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isOtp;
  }

  Future<bool> otpVerify(String email, String otp) async {
    bool isOtpVerified = false;

    try {
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(
        baseUrl + otpverify,
        data: {
          "email": email,
          "otp": otp,
        },
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isOtpVerified;
  }

  Future<bool> passwordReset(String email, String newPassword) async {
    bool isOtpVerified = false;

    try {
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(
        baseUrl + resetPassword,
        data: {
          "email": email,
          "newPassword": newPassword,
        },
      );
      debugPrint("sfgfgdffffffffffffffffffffffffff${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isOtpVerified;
  }
}
