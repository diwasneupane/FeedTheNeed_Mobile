import 'package:feedtheneed/api/change_password_api.dart';
import 'package:feedtheneed/model/change_password.dart';

class ChangePasswordRepository {
  Future<List<dynamic>> changePassword(
      ChangePasswordModel changePassword) async {
    return await ChangePasswordApi().changePassword(changePassword);
  }
}
