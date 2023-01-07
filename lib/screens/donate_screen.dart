import 'package:feedtheneed/model/donate_model.dart';
import 'package:feedtheneed/model/profile.dart';
import 'package:feedtheneed/repositories/donate_repository.dart';
import 'package:feedtheneed/repositories/user_repository.dart';
import 'package:feedtheneed/screens/navigation.dart';
import 'package:feedtheneed/utils/showmessages.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

const List<String> list = <String>[
  'Orphanage',
  'Old Age Home',
  'Homeless',
  'Clothing',
  'FeedTheNeed Recommended',
  'Others'
];

class Donate extends StatefulWidget {
  // const Donate({super.key});
  const Donate({Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  UserProfile? user;
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    UserProfile? user1 = await UserRepository().getUserDetails();

    setState(() {
      user = user1!;
    });
  }

  final _globalkey = GlobalKey<FormState>();

  final _donornameController = TextEditingController();
  final _donoraddressController = TextEditingController();
  final _donornoteController = TextEditingController();
  String dropdownValue = list.first;

  // List of items in our dropdown menu

  final _amountController = TextEditingController();

  getAmt() {
    // return int.parse(_amountController.text) * 100; // Converting to paisa
    return int.parse(_amountController.text) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: _globalkey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            // alignment: Alignment.centerRight,
                            ),
                      ),
                      const Text(
                        "Donate",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: CircleAvatar(
                      radius: 90.0,
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  //for user data
                  TextFormField(
                    controller: _donornameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your First name';
                      }
                      return null;
                    },
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      // icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter Donor name.Eg: Jhon',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(
                        Icons.category_outlined,
                        color: Colors.grey,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Container(
                        width: 320,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 233, 233),
                          // border: Border.all(

                          //   color: Colors.black,
                          //   width: 1,
                          // ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0, left: 12),
                          child: Center(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(20).copyWith(
                                topLeft: const Radius.circular(20),
                                topRight: const Radius.circular(20),
                                bottomLeft: const Radius.circular(20),
                                bottomRight: const Radius.circular(20),
                              ),

                              focusColor: Colors.red,
                              autofocus: true,

                              // hint: const Text("Select Category"),
                              dropdownColor:
                                  const Color.fromARGB(255, 255, 255, 255),

                              icon: const Icon(Icons.arrow_drop_down_outlined),
                              iconSize: 36,
                              value: dropdownValue,

                              elevation: 2,

                              isExpanded: true,

                              style: const TextStyle(
                                  color: Color.fromARGB(255, 87, 87, 87)),
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _donoraddressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Donor Address';
                      }
                      return null;
                    },
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.place_outlined),
                      // icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter Donor Address.Eg: Maitidevi',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),

                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _donornoteController,
                    // key: const ValueKey('fname'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter donor note';
                      }
                      return null;
                    },
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.note_alt_outlined),
                      // icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter Donor Note',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // For Amount
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.add_card),
                      // icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter Donation Amount',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  // For Button
                  MaterialButton(
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      color: const Color(0xff41A2CD),
                      child: const Text(
                        'Pay With Khalti',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        KhaltiScope.of(context).pay(
                          config: PaymentConfig(
                            amount: getAmt(),
                            productIdentity: 'dells-sssssg5-g5510-2021',
                            productName: 'Product Name',
                          ),
                          preferences: [
                            PaymentPreference.khalti,
                          ],
                          onSuccess: (su) {
                            // double totalDonationPoint =
                            //     double.parse(user!.donation_point!.toString());

                            // totalDonationPoint +=
                            //     int.parse(_amountController.text) / 1000;
                            // debugPrint(
                            //     "Total donation Point: $totalDonationPoint");

                            // debugPrint("Success Pay: ${su.productName}");
                            DonateModel donateModel = DonateModel(
                              donation_amount:
                                  int.parse(_amountController.text),
                              donation_category: dropdownValue,
                              donor_name: _donornameController.text,
                              donor_note: _donornoteController.text,
                              donor_address: _donoraddressController.text,
                              idx: su.idx,
                              token: su.token,
                            );
                            _donationData(donateModel);
                            // const successsnackBar = SnackBar(
                            //   content: Text('Payment Successful'),
                            // );
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(successsnackBar);
                          },
                          onFailure: (fa) {
                            const failedsnackBar = SnackBar(
                              content: Text('Payment Failed'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(failedsnackBar);
                          },
                          onCancel: () {
                            const cancelsnackBar = SnackBar(
                              content: Text('Payment Cancelled'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(cancelsnackBar);
                          },
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _donationData(DonateModel donateModel) async {
    bool isDonated = await DonateRepository().donation(donateModel);
    _displayMessage(isDonated);
  }

  _displayMessage(bool isDonated) {
    if (isDonated) {
      _updateDonationPoint();
      displaySuccessMessage(context, "Donation successful");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const Navigation(
                    index: 0,
                  )),
        );
      });
    } else {
      displayErrorMessage(context, "Donation Failed");
    }
  }

  _updateDonationPoint() async {
    bool isSignUp = await DonateRepository().donationPoint();
    // _displayMessage(isSignUp);
  }
}
