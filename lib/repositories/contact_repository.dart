// import 'package:feedtheneed/model/.dart';

import 'package:feedtheneed/api/contact_api.dart';
import 'package:feedtheneed/model/contact.dart';

class ContactRepository {
  Future<List<ContactUsData?>> getContactDetails() async {
    return await ContactApi().getContactDetails();
  }
}
