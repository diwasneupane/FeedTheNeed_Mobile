import 'package:feedtheneed/screens/contactUs.dart';
import 'package:feedtheneed/screens/map.dart';
import 'package:flutter/material.dart';

class Helpandsupport extends StatefulWidget {
  const Helpandsupport({Key? key}) : super(key: key);

  @override
  State<Helpandsupport> createState() => _HelpandsupportState();
}

class _HelpandsupportState extends State<Helpandsupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Help & Support",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 90.0,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      spreadRadius: 0,
                      blurRadius: 44,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        key: const ValueKey('contactus'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactUs(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 241, 250, 253),
                              radius: 27,
                              child: Icon(
                                Icons.contact_page,
                                color: Color(0xFF41A2CD),
                              ),
                            ),
                          ),
                          title: const Text(
                            "Contact Us",
                          ),
                          subtitle: const Text("Let be in touch with us",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 10)),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactUs(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        key: const ValueKey('mapview'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MapScreen(),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 241, 250, 253),
                              radius: 27,
                              child: Icon(
                                Icons.location_pin,
                                color: Color(0xFF41A2CD),
                              ),
                            ),
                          ),
                          title: const Text(
                            "Our Location",
                          ),
                          subtitle: const Text("See us at our door steps",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 10)),
                          trailing: IconButton(
                            onPressed: () {
                              //  _loadImage(ImageSource.gallery);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MapScreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const RefundRequest()),
                      //     );
                      //   },
                      //   child: ListTile(
                      //     leading: const CircleAvatar(
                      //       radius: 30,
                      //       backgroundColor: Colors.white,
                      //       child: CircleAvatar(
                      //         backgroundColor:
                      //             Color.fromARGB(255, 241, 250, 253),
                      //         radius: 27,
                      //         child: Icon(
                      //           Icons.cancel_outlined,
                      //           color: Color(0xFF41A2CD),
                      //         ),
                      //       ),
                      //     ),
                      //     title: const Text(
                      //       "Refund Donation",
                      //     ),
                      //     subtitle: const Text("Incase of emergency ",
                      //         style: TextStyle(
                      //             color: Colors.blueGrey, fontSize: 10)),
                      //     trailing: IconButton(
                      //       onPressed: () {
                      //         //action coe when button is pressed
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                   const RefundRequest()),
                      //         );
                      //       },
                      //       icon: const Icon(
                      //         Icons.keyboard_arrow_right_outlined,
                      //         color: Colors.blueGrey,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
