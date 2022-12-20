import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:feedtheneed/screens/blogscreen.dart';
import 'package:feedtheneed/screens/dashboard.dart';
import 'package:feedtheneed/screens/donate_screen.dart';
import 'package:feedtheneed/screens/donation_history.dart';
import 'package:feedtheneed/screens/profile.dart';

import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final int index;
  const Navigation({Key? key, this.index = 1}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int increment = 0;
  int _currentIndex = 0;
  // PageController? _pageController;

  @override
  void initState() {
    super.initState();
    setState(() {
      const Dashboard();
    });
    // _pageController = PageController();
  }

  @override
  void dispose() {
    // _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: increment == 0 ? widget.index : _currentIndex,
        children: const <Widget>[
          Dashboard(),
          DonationHistory(),
          Donate(),
          BlogScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: increment == 0 ? widget.index : _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
            increment = 1;
          });
          // _pageController!.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text('Home',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 186, 225),
                )),
            icon: const Icon(
              size: 30,
              Icons.dashboard_outlined,
              // color: Color(0xff41A2CD),
            ),
            activeColor: const Color(0xff41A2CD),
            inactiveColor: Colors.blueGrey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('History',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 186, 225),
                )),
            icon: const Icon(
              size: 30,
              Icons.account_balance_wallet_outlined,
              // color: Color(0xff41A2CD),
            ),
            activeColor: const Color(0xff41A2CD),
            inactiveColor: Colors.blueGrey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('Donate',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 186, 225),
                )),
            icon: const Icon(
              size: 30,
              Icons.add_card,
              // color: Color(0xff41A2CD),
            ),
            activeColor: const Color(0xff41A2CD),
            inactiveColor: Colors.blueGrey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('Blog',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 186, 225),
                )),
            icon: const Icon(
              size: 30,
              Icons.book,
              // color: Color(0xff41A2CD),
            ),
            activeColor: const Color(0xff41A2CD),
            inactiveColor: Colors.blueGrey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('Profile',
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 186, 225),
                )),
            icon: const Icon(
              size: 30,
              Icons.person_outline_outlined,
              // color: Color(0xff41A2CD),
            ),
            activeColor: const Color(0xff41A2CD),
            inactiveColor: Colors.blueGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
