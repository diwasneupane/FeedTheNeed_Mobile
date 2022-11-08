import 'package:feedtheneed/screens/aboutus.dart';
import 'package:feedtheneed/screens/blogscreen.dart';
import 'package:feedtheneed/screens/changepassword.dart';
import 'package:feedtheneed/screens/contactus.dart';
import 'package:feedtheneed/screens/dashboard.dart';
import 'package:feedtheneed/screens/email.dart';
import 'package:feedtheneed/screens/helpandsupport.dart';
import 'package:feedtheneed/screens/information.dart';
import 'package:feedtheneed/screens/login.dart';
import 'package:feedtheneed/screens/map.dart';
import 'package:feedtheneed/screens/myaccount.dart';
import 'package:feedtheneed/screens/navigation.dart';
import 'package:feedtheneed/screens/passwordreset.dart';
import 'package:feedtheneed/screens/profile.dart';
import 'package:feedtheneed/screens/register.dart';
import 'package:feedtheneed/screens/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(
    KhaltiScope(
        publicKey: "test_public_key_0800545e039d45368cab4d1b2fb93d01",
        builder: (context, navigatorKey) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            initialRoute: '/login',
            routes: {
              // '/': (context) => const WearOs(),
              '/login': (context) => const Login(),
              '/register': (context) => const Register(),
              '/dashboard': (context) => const Dashboard(),
              '/navigation': (context) => const Navigation(),
              '/profile': (context) => const Profile(),
              '/update': (context) => const Update(),
              '/account': (context) => const MyAccount(),
              '/helpandsupport': (context) => const Helpandsupport(),
              '/information': (context) => const Information(),
              '/contact': (context) => const ContactUs(),
              '/blog': (context) => const BlogScreen(),
              '/map': (context) => const MapScreen(),
              // '/blogdescription': (context) => const BlogDescription(),
              '/aboutUs': (context) => const AboutUs(),
              '/changepassword': (context) => const ChangePassword(),
              '/email': (context) => const Email(),
              '/resetpassword': (context) => const ResetPassword()
            },
          );
        }),
  );
}
