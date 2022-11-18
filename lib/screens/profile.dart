import 'package:feedtheneed/model/profile.dart';
import 'package:feedtheneed/repositories/user_repository.dart';
import 'package:feedtheneed/screens/aboutus.dart';
import 'package:feedtheneed/screens/donationpoint.dart';
import 'package:feedtheneed/screens/helpandsupport.dart';
import 'package:feedtheneed/screens/myaccount.dart';
import 'package:feedtheneed/screens/update_profile.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (user != null)
                  Container(
                    height: 95,
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
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 27,
                            backgroundImage: user!.picture == null
                                ? const NetworkImage(
                                    "https://www.javatpoint.com/js/nodejs/images/nodejs-sorting2.png")
                                : NetworkImage(baseUrl + user!.picture!),
                          ),
                        ),
                        title: Text(
                          user!.email!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          user!.username == null
                              ? "Update your username"
                              : "${user!.username}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Update()));
                            //action coe when button is pressed
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.09),
                        spreadRadius: 0,
                        blurRadius: 44,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          key: const ValueKey('account'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyAccount(),
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
                                  Icons.person_outline,
                                  color: Color(0xFF41A2CD),
                                ),
                              ),
                            ),
                            title: const Text(
                              "My Account ",
                            ),
                            subtitle: const Text(
                                "View all the important information",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 10)),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyAccount(),
                                  ),
                                );
                                //action coe when button is pressed
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DonationPoint()),
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
                                  Icons.auto_graph,
                                  color: Color(0xFF41A2CD),
                                ),
                              ),
                            ),
                            title: const Text(
                              "Donation Point ",
                            ),
                            subtitle: const Text("View your donation point",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 10)),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DonationPoint(),
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
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "More",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.09),
                        spreadRadius: 0,
                        blurRadius: 44,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          key: const ValueKey('helpandsupport'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Helpandsupport(),
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
                                  Icons.notifications_active_outlined,
                                  color: Color(0xFF41A2CD),
                                ),
                              ),
                            ),
                            title: const Text(
                              "Help & Support",
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Helpandsupport(),
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
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AboutUs(),
                                ));
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
                                  Icons.favorite_border,
                                  color: Color(0xFF41A2CD),
                                ),
                              ),
                            ),
                            title: const Text(
                              "About App ",
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AboutUs(),
                                    )); //action coe when button is pressed
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
