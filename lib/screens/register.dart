import 'package:email_validator/email_validator.dart';
import 'package:feedtheneed/model/user.dart';
import 'package:feedtheneed/repositories/user_repository.dart';
import 'package:feedtheneed/screens/login.dart';
import 'package:feedtheneed/utils/showmessages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

final TextEditingController _passwordController = TextEditingController();

class _RegisterState extends State<Register> {
  bool success = false;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _passwordController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: 100,
                    bottom: 30,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                const Text(
                  "Create an account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Help with ease of button",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  key: const ValueKey('email'),
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                  controller: _emailController,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Example@gmail.com',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                    key: const ValueKey('phone'),
                    controller: _phoneController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: '+977 | Enter your phone number here',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _globalKey.currentState?.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter a Phone Number";
                      } else if (!RegExp(
                              r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                          .hasMatch(value)) {
                        return "Please Enter a Valid Phone Number";
                      }
                      return null;
                    }),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (success == false) {
                      return 'Please fullfill necessary requirements';
                    }
                    return null;
                  },
                  obscureText: _isHidden,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: const Icon(Icons.password),
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: const Icon(Icons.visibility),
                    ),
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
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
                  height: 5,
                ),
                FlutterPwValidator(
                  controller: _passwordController,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  normalCharCount: 3,
                  successColor: const Color(0xFF41A2CD),
                  defaultColor: Colors.grey,
                  failureColor: const Color(0xFF781f19),
                  width: 400,
                  height: 150,
                  onSuccess: () {
                    setState(() {
                      success = true;
                    });
                  },
                  onFail: () {
                    setState(() {
                      success = false;
                    });
                    print("Didn't matched standard");
                  },
                ),

                // Checkbox(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(2.0),
                //     ),
                //     activeColor: Colors.transparent,
                //     checkColor: Colors.black,
                //     //only check box
                //     value: check1, //unchecked
                //     onChanged: (bool? value) {
                //       //value returned when checkbox is clicked
                //       setState(() {
                //         check1 = value;
                //       });
                //     }),
                // const Text("ejknkj")
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      key: const ValueKey('btnSignup'),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          User user = User(
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                          );
                          _registerUser(user);
                        }
                      },
                      child: Text(
                        "Register".toUpperCase(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: ' already have an account ? ',
                          style: TextStyle(color: Colors.grey)),
                      WidgetSpan(
                          child: GestureDetector(
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                      ))
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  _registerUser(User user) async {
    bool isSignUp = await UserRepository().registerUser(user);
    _displayMessage(isSignUp);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "register success");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Login()),
        );
      });
    } else {
      displayErrorMessage(context, "register Failed");
    }
  }

  // void _showToast(BuildContext context) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     const SnackBar(
  //       content: Text(
  //         'Register Sucessfully',
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }
}
