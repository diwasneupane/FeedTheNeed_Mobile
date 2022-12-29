import 'package:feedtheneed/api/refund_donation_api.dart';
import 'package:feedtheneed/model/refund_model.dart';

class RefundRepository {
  Future<bool> getRefundRequest(RefundModel refundModel) async {
    return await RefundRequestApi().getRefundRequest(refundModel);
  }
}
