import 'package:feedtheneed/api/user_transaction_api.dart';
import 'package:feedtheneed/model/all_transaction_model.dart';
import 'package:feedtheneed/model/user_transaction.dart';
// import 'package:feedtheneed/model/Map.dart';

class UserTransactionRepository {
  Future<List<UserTransaction?>> userTransactionDetails() async {
    return await UserTransactionApi().userTransactionDetails();
  }

  Future<List<AllUserTransaction?>> allUserTransactionDetails() async {
    return await UserTransactionApi().allUserTransactionDetails();
  }
}
