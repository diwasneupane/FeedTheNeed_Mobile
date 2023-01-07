import 'package:feedtheneed/model/change_password.dart';
import 'package:feedtheneed/repositories/change_password_repository.dart';
import 'package:feedtheneed/screens/myaccount.dart';
import 'package:feedtheneed/utils/showmessages.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _globalKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool success = false;

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

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
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Current Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _currentPasswordController,
                        key: const ValueKey('password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please fullfill necessary requirements';
                          }
                          return null;
                        },
                        obscureText: _isHidden,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Enter Your current Password',
                          prefixIcon: const Icon(Icons.password),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: const Icon(Icons.visibility),
                          ),
                          hintStyle:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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
                        height: 25,
                      ),
                      const Text('New Password'),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _newPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please fullfill necessary requirements';
                          }
                          return null;
                        },
                        obscureText: _isHidden,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Enter your new Password',
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
                        height: 25,
                      ),
                      const Text('Confirm New Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _confirmNewPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please fullfill necessary requirements';
                          }
                          return null;
                        },
                        obscureText: _isHidden,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Re-Enter your new Password',
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
                        height: 25,
                      ),
                      Center(
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            key: const ValueKey('btnUpdate'),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xff41A2CD)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {
                                ChangePasswordModel changePasswordModel =
                                    ChangePasswordModel(
                                  currentPassword:
                                      _currentPasswordController.text,
                                  newPassword: _newPasswordController.text,
                                  confirmNewPassword:
                                      _confirmNewPasswordController.text,
                                );
                                _registerUser(changePasswordModel);
                              }
                            },
                            child: const Text(
                              "Change Password",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
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

  _registerUser(ChangePasswordModel changePassword) async {
    List<dynamic> isSignUp =
        await ChangePasswordRepository().changePassword(changePassword);
    _displayMessage(isSignUp);
  }

  _displayMessage(List<dynamic> isSignUp) {
    if (isSignUp[0]) {
      displaySuccessMessage(context, isSignUp[1]);
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MyAccount()),
        );
      });
    } else {
      displayErrorMessage(context, isSignUp[1]);
    }
  }
}
