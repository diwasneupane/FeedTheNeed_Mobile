import 'package:feedtheneed/api/partner_api.dart';

class PartnerRepository {
  Future<List<dynamic>> getPartner() async {
    return PartnerApi().getPartner();
  }
}
