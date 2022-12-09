import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
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
          "About Us",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 195,
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
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.justify,
                        'Charities can carry out their crucial work thanks to the generosity of people like you. And when you donate to a cause you care about, youll know that your decision to donate is making a tangible impact on the lives of those the charity helps. Donating to charity feels good and motivates people to practice unselfish concern for others. In fact, scientific studies show that generosity stimulates dopamine, which creates similar brain activity in the regions connected to the experience of pleasure and reward.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xFF41A2CD)),
              )),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "FeedTheNeed working process",
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconStepper(
                lineColor: const Color.fromARGB(250, 0, 0, 0),
                stepColor: const Color.fromARGB(255, 211, 211, 211),
                activeStepColor: const Color(0xFF41A2CD),
                icons: const [
                  Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.wallet_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.question_mark_outlined,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.wallet_travel,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.add_card,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.menu_book,
                    color: Colors.white,
                  ),
                ],

                // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,

                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
            ),
            header(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF41A2CD),
          textStyle: const TextStyle(fontSize: 20),
          shape: const StadiumBorder(),
          minimumSize: const Size(150, 50),
        ),
        onPressed: () {
          if (activeStep < upperBound) {
            setState(() {
              activeStep++;
            });
          }
        },
        child: Row(
          children: const <Widget>[
            Text("Next"), // text
            SizedBox(
              width: 8,
            ), // icon
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget previousButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF41A2CD),
          textStyle: const TextStyle(fontSize: 20),
          shape: const StadiumBorder(),
          minimumSize: const Size(150, 50),
        ),
        onPressed: () {
          if (activeStep > 0) {
            setState(() {
              activeStep--;
            });
          }
        },
        child: Row(
          children: const <Widget>[
            Icon(Icons.arrow_back_ios), // icon
            Text(
              "Back",
            ), // text
          ],
        ),
      ),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              spreadRadius: 0,
              blurRadius: 44,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                headerText(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Donation Panel';

      case 2:
        return 'Select Category';

      case 3:
        return 'Choose Wallet';

      case 4:
        return 'Donate';

      case 5:
        return 'Admin Verifies Donation';

      case 6:
        return 'See Posted blog of donation';

      default:
        return 'Login';
    }
  }
}
  /// Returns the header wrapping the header text.

  // Returns the header text based on the activeStep.
