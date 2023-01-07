import 'package:feedtheneed/screens/contactus.dart';
import 'package:feedtheneed/screens/helpandsupport.dart';
import 'package:feedtheneed/screens/information.dart';
import 'package:feedtheneed/screens/login.dart';
import 'package:feedtheneed/screens/map.dart';
import 'package:feedtheneed/screens/myaccount.dart';
import 'package:feedtheneed/screens/profile.dart';
import 'package:feedtheneed/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Login test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/login': (context) => const Login(),
        },
        home: const Login(),
      ),
    );
    Finder email = find.byKey(const ValueKey('email'));
    await tester.enterText(email, 'diwas@gmail.com');
    Finder password = find.byKey(const ValueKey('password'));
    await tester.enterText(password, 'Diw@s123');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(warnIfMissed: false, btnLogin);
    await tester.pumpAndSettle();
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets('register user test', (WidgetTester tester) async {
    await tester.pumpWidget(
      // ignore: prefer_const_constructors
      MaterialApp(
        routes: {
          '/register': (context) => const Register(),
        },
        home: const Register(),
      ),
    );
    // Finder title = find.text('Arithmetics');
    // expect(title, findsOneWidget);
    Finder email = find.byKey(const ValueKey('email'));
    await tester.enterText(email, 'diwas1@gmail.com');
    Finder phone = find.byKey(const ValueKey('phone'));
    await tester.enterText(phone, '9847078571');
    Finder password = find.byKey(const ValueKey('password'));
    await tester.enterText(password, 'Diw@s123');

    Finder btnSignup = find.byKey(const ValueKey('btnSignup'));
    await tester.pumpAndSettle();
    await tester.tap(btnSignup, warnIfMissed: false);

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  // testWidgets('Update testing', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     // ignore: prefer_const_constructors
  //     MaterialApp(
  //       routes: {
  //         '/update': (context) => const Update(),
  //       },
  //       home: const Profile(),
  //     ),
  //   );
  //   // Finder title = find.text('Arithmetics');
  //   // expect(title, findsOneWidget);
  //   Finder fname = find.byKey(const ValueKey('fname'));
  //   await tester.enterText(fname, 'a');
  //   Finder lname = find.byKey(const ValueKey('lname'));
  //   await tester.enterText(lname, 'a');
  //   Finder username = find.byKey(const ValueKey('username'));
  //   await tester.enterText(username, 'a');
  //   Finder address = find.byKey(const ValueKey('address'));
  //   await tester.enterText(address, 'a');

  //   Finder phone = find.byKey(const ValueKey('phone'));
  //   await tester.enterText(phone, "9200000000");
  //   // Finder age = find.byKey(const ValueKey('dob'));
  //   // await tester.enterText(age, "2002-01-02");
  //   Finder btnUpdate = find.byKey(const ValueKey('btnUpdate'));
  //   await tester.tap(btnUpdate);
  //   await tester.pumpAndSettle();
  //   expect(find.byType(Container), findsOneWidget);
  // });
  testWidgets('profile to myaccount', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/account': (context) => const MyAccount(),
        },
        home: const Profile(),
      ),
    );
    Finder account = find.byKey(const ValueKey('account'));
    await tester.tap(account);
  });
  testWidgets('myaccout to information', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/information': (context) => const Information(),
        },
        home: const MyAccount(),
      ),
    );
    Finder information = find.byKey(const ValueKey('information'));
    await tester.tap(information);
  });
  testWidgets('Profile to help and support', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/helpandsupport': (context) => const Helpandsupport(),
        },
        home: const Profile(),
      ),
    );
    Finder helpandsupport = find.byKey(const ValueKey('helpandsupport'));
    await tester.tap(helpandsupport);
  });
  testWidgets(' help and support to contact us', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/contact': (context) => const ContactUs(),
        },
        home: const Helpandsupport(),
      ),
    );
    Finder contactus = find.byKey(const ValueKey('contactus'));
    await tester.tap(contactus);
  });
  testWidgets(' help and support to Map(organization location)',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/map': (context) => const MapScreen(),
        },
        home: const Helpandsupport(),
      ),
    );
    Finder mapview = find.byKey(const ValueKey('mapview'));
    await tester.tap(mapview);
  });
}
