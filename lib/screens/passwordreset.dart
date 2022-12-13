import 'package:email_validator/email_validator.dart';
import 'package:feedtheneed/repositories/user_repository.dart';
import 'package:feedtheneed/screens/login.dart';
import 'package:feedtheneed/utils/showmessages.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isHidden = true;
  bool _isHidden2 = true;
  bool? check1 = false;

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _emailController.dispose();
  }

  // final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0x00ffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter your New Password to want to set",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 249, 249),
                    // color: const Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset:
                            const Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 310,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'New Password',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: const ValueKey('email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
                                    : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Exapmle@gmail.com',
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 242, 241, 241),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.always,
                            controller: _newPasswordController,
                            obscureText: _isHidden2,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password Here',
                              prefixIcon: const Icon(Icons.password),
                              suffix: InkWell(
                                onTap: _togglePasswordView2,
                                child: const Icon(Icons.visibility),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
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
                            height: 32,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _resetPassword();
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFF41A2CD)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Text(
                                  'Send',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  _resetPassword() async {
    bool isOtpSent = await UserRepository()
        .resetPassword(_emailController.text, _newPasswordController.text);
    _displayMessage(isOtpSent);
  }

  _displayMessage(bool isOtpSent) {
    if (isOtpSent) {
      if (_formKey.currentState!.validate()) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Login()),
        );
        Future.delayed(const Duration(milliseconds: 100), () {
          // Navigator.pushNamed(context, '/bottomNavBar');

          displaySuccessMessage(context, "Password reset Success");
        });
      } else {
        displayErrorMessage(context, "Password reset failed");
      }
    }
  }
}
