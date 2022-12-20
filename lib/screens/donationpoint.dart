import 'package:feedtheneed/model/profile.dart';
import 'package:feedtheneed/repositories/leaderboard_repository.dart';
import 'package:feedtheneed/repositories/user_repository.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';

class DonationPoint extends StatefulWidget {
  const DonationPoint({Key? key}) : super(key: key);

  @override
  _DonationPointState createState() => _DonationPointState();
}

class _DonationPointState extends State<DonationPoint> {
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
          "Donation Point",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // decoration: BoxDecoration(
            //   // color: Color(0xFF41A2CD),
            //   border: Border.all(color: const Color(0xFF41A2CD)),
            //   borderRadius: const BorderRadius.only(
            //     bottomRight: Radius.circular(20),
            //     bottomLeft: Radius.circular(20),
            //   ),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FutureBuilder<List<UserProfile?>>(
                      future: LeaderBoardRepository().leaderBoard(),
                      builder: (context, snapshot) {
                        // debugPrint(snapshot.data.toString());
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            List<UserProfile?> lstleaderboard = snapshot.data!;
                            // debugPrint("dsfsjnj${lstleaderboard.length}");
                            int rank = 0;

                            // total_user_transaction(
                            //     lstTransaction[index]!.donation_amount!);
                            for (int i = 0; i < snapshot.data!.length; i++) {
                              if (snapshot.data![i]!.email == user!.email) {
                                rank = i;
                              }
                            }
                            return Column(
                              children: [
                                if (user != null)
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.08),
                                            BlendMode.dstIn),
                                        image: const NetworkImage(
                                          "https://img.freepik.com/free-vector/charity-doodle-vector-background-donation-concept_53876-143434.jpg",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      // color: const Color(0xFF41A2CD),
                                      // border: Border.all(color: const Color(0xFF41A2CD)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.15),
                                          spreadRadius: 0,
                                          blurRadius: 2,
                                          offset: const Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: user!.picture ==
                                                      null
                                                  ? const NetworkImage(
                                                      "https://www.javatpoint.com/js/nodejs/images/nodejs-sorting2.png")
                                                  : NetworkImage(
                                                      baseUrl + user!.picture!),
                                              radius: 60,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user!.username == null
                                              ? "Update your username"
                                              : "${user!.username}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            // color: Colors.white,
                                            // fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          thickness: 1,
                                          indent: 20,
                                          endIndent: 20,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          minWidth: 10,
                                                          maxWidth: 140,
                                                          maxHeight: 50),
                                                  child: Text(
                                                    user!.donation_point == null
                                                        ? "Update your Donation point"
                                                        : "${user!.donation_point}",
                                                    // overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 42,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      // color: Colors.white.withOpacity(0.9),
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "Donation Point",
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    // fontWeight: FontWeight.bold,
                                                    // color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text((rank + 1).toString(),
                                                    style: const TextStyle(
                                                      fontSize: 42,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      // color: Colors.white.withOpacity(0.9),
                                                    )),
                                                const Text("Rank",
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      // fontWeight: FontWeight.bold,
                                                      // color: Colors.white,
                                                    )),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Leaderboard",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.53,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        border: Border.all(
                                            color: const Color(0xFF41A2CD)),
                                      ),
                                      margin: const EdgeInsets.all(1),
                                      child: SizedBox(
                                        height: 300,
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: lstleaderboard[
                                                                      index]!
                                                                  .picture ==
                                                              null
                                                          ? const NetworkImage(
                                                              "https://www.javatpoint.com/js/nodejs/images/nodejs-sorting2.png")
                                                          : NetworkImage(baseUrl +
                                                              lstleaderboard[
                                                                      index]!
                                                                  .picture!),
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    Text(lstleaderboard[index]!
                                                        .email!)
                                                  ],
                                                ),
                                                leading: Text(
                                                  "#${index + 1}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                trailing: Text(
                                                    lstleaderboard[index]!
                                                        .donation_point!
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const Divider(
                                                      thickness: 1,
                                                      color: Color(0xFF41A2CD),
                                                      indent: 10,
                                                      endIndent: 10,
                                                    ),
                                            itemCount: lstleaderboard.length),
                                      )),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: Text("No data"),
                            );
                          }
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff754A4A)),
                            ),
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
