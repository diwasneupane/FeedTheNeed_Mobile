// ignore_for_file: unused_local_variable

import 'package:feedtheneed/model/all_transaction_model.dart';
import 'package:feedtheneed/repositories/user_transaction_repository.dart';
import 'package:feedtheneed/screens/donationpoint.dart';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<AllUserTransaction?> transaction = [];
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    List<AllUserTransaction?> user1 =
        await UserTransactionRepository().allUserTransactionDetails();

    setState(() {
      transaction = user1;
    });
  }

  final double _opacity = 1;
  Map<String, double> dataMap = {
    "Pending": 18,
    "Received": 17,
    "Used": 4,
    "Unused": 3,
  };

  List<Color> colorList = [
    Colors.red,
    const Color(0xff3EE094),
    const Color(0xFF41A2CD),
    const Color.fromARGB(255, 182, 53, 226),
  ];
  List<Color> gradientColors = [
    const Color(0xFF41A2CD),
    const Color(0xFF41A2CD),
  ];

  bool showAvg = false;
  int pending = 0;
  int received = 0;
  int used = 0;
  int unused = 0;

  int totalMoney = 0;

  @override
  Widget build(BuildContext context) {
    int pending_1 = 0;
    int received_1 = 0;
    int used_1 = 0;
    int unused_1 = 0;

    int totalMoney_1 = 0;

    for (var i = 0; i < transaction.length; i++) {
      AllUserTransaction? userTransaction = transaction[i];
      setState(() {
        totalMoney_1 += userTransaction!.donation_amount!;
      });
      if (userTransaction!.donation_status == "Pending") {
        // debugPrint("Pending");
        setState(() {
          pending_1 += 1;
        });
      } else if (userTransaction.donation_status == "Received") {
        setState(() {
          received_1 += 1;
        });
      } else if (userTransaction.donation_status == "Used") {
        setState(() {
          used_1 += 1;
        });
      } else {
        setState(() {
          unused_1 += 1;
        });
      }
    }

    pending = pending_1;
    received = received_1;
    used = used_1;
    unused = unused_1;
    totalMoney = totalMoney_1;

    dataMap = {
      "Pending": double.parse(pending.toString()),
      "Received": double.parse(received.toString()),
      "Used": double.parse(used.toString()),
      "Unused": double.parse(unused.toString()),
    };

    return 
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: Container(
                  alignment: Alignment.center,
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF41A2CD),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 27,
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                    title: const Text(
                      "Our Top Donners",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                    subtitle: const Text(
                      "See Here",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DonationPoint()));
                        //action coe when button is pressed
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
