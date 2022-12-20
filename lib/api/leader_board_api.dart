import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/model/profile.dart';
import 'package:feedtheneed/response/leaderboard_response.dart';
// import 'package:feedtheneed/screens/contactusDatUserProfile.dart';
import 'package:feedtheneed/utils/api_url.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LeaderBoardApi {
  Future<List<UserProfile?>> getLeaderBoardDetails() async {
    List<UserProfile?> leaderList = [];
    // UserProfile? contactUs;
    try {
      var url = baseUrl + leaderboard;
      var dio = HttpServices().getDioInstance();

      var response = await dio.get(
        url,
      );
      if (response.statusCode == 201) {
        LeaderBoardResponse leaderBoardResponse =
            LeaderBoardResponse.fromJson(response.data);

        for (var data in leaderBoardResponse.data) {
          leaderList.add(
            UserProfile(
              user_id: data!.user_id,
              email: data.email,
              phone: data.phone,
              password: data.password,
              donation_point: data.donation_point,
              picture: data.picture,
            ),
          );
        }
      }
    } catch (e) {}

    return leaderList;
  }
}
