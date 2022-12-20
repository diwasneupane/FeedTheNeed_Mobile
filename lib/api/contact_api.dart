import 'package:feedtheneed/api/http_services.dart';
import 'package:feedtheneed/model/contact.dart';
import 'package:feedtheneed/response/contact_response.dart';
// import 'package:feedtheneed/screens/contactusDatContactUsData.dart';
import 'package:feedtheneed/utils/api_url.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ContactApi {
  Future<List<ContactUsData?>> getContactDetails() async {
    List<ContactUsData?> contactList = [];
    // ContactUsData? contactUs;
    try {
      var url = baseUrl + contact;
      var dio = HttpServices().getDioInstance();
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? token = prefs.getString("token");
      // debugPrint("Token123: ${token!}");
      var response = await dio.get(
        url,
      );

      if (response.statusCode == 201) {
        ContactResponse contactModelResponse =
            ContactResponse.fromJson(response.data);

        for (var data in contactModelResponse.data) {
          contactList.add(
            ContactUsData(
              id: data!.id,
              company_name: data.company_name,
              company_address: data.company_address,
              company_phone: data.company_phone,
              company_founded: data.company_founded,
            ),
          );
        }
      }
    } catch (e) {}

    return contactList;
  }
}
