import 'package:feedtheneed/model/contact.dart';
import 'package:feedtheneed/repositories/contact_repository.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  List<ContactUsData?> contact = [];
  @override
  void initState() {
    getContactDetails();
    // debugPrint(getcontactDetails().toString());
    super.initState();
  }

  void getContactDetails() async {
    List<ContactUsData?> contact1 =
        await ContactRepository().getContactDetails();
    // debugPrint(contact1.toString());

    setState(() {
      contact = contact1;
      // debugPrint('add$contact');
    });
  }

  @override
  Widget build(BuildContext context) {
    return contact.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                "My Information",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 70.0,
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contact[0]!.company_name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contact[0]!.company_address!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      // alignment: Alignment.centerLeft,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Information",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Company Name",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: const Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 239, 237, 237),
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                contact[0]!.company_name!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Company Number",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: const Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 239, 237, 237),
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                contact[0]!.company_phone!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Company Address",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: const Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 239, 237, 237),
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                contact[0]!.company_address!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Company Founded On",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: const Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 239, 237, 237),
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                contact[0]!.company_founded!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Scaffold();
  }
}
