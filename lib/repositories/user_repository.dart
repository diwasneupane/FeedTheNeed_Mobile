import 'dart:io';

import 'package:feedtheneed/api/otpsendar_api.dart';
import 'package:feedtheneed/model/profile.dart';

import '/api/user_api.dart';
import '../model/user.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> login(String email, String password) {
    return UserAPI().login(email, password);
  }

  Future<UserProfile?> getUserDetails() async {
    return await UserAPI().getUserDetails();
  }

  Future<bool> updateUserProfile(UserProfile userProfile, File? image) async {
    return await UserAPI().updateUserProfile(userProfile, image);
  }

  Future<bool> updateUserDonationPoint(String donationPoint) async {
    return await UserAPI().updateUserDonationPoint(donationPoint);
  }

  Future<bool> Otp(String email) async {
    return await OtpApi().Otp(email);
  }

  Future<bool> otpVerify(String email, String otp) async {
    return await OtpApi().otpVerify(email, otp);
  }

  Future<bool> resetPassword(String email, String newPassword) async {
    return await OtpApi().passwordReset(email, newPassword);
  }
}
