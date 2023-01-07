import 'package:feedtheneed/api/leader_board_api.dart';
import 'package:feedtheneed/model/profile.dart';

class LeaderBoardRepository {
  Future<List<UserProfile?>> leaderBoard() async {
    return await LeaderBoardApi().getLeaderBoardDetails();
  }
}
