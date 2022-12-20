import 'package:feedtheneed/api/http_services.dart';
// import 'package:feedtheneed/model/Map.dart';
import 'package:feedtheneed/utils/api_url.dart';

class DonationPointApi {
  Future<bool> updateDonationPoint() async {
    // MapData? contactUs;
    try {
      var url = baseUrl + donationpoint;
      var dio = HttpServices().getDioInstance();
      var response = await dio.patch(
        url,
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {}
    return false;
  }
}
