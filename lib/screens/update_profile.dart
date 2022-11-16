import 'dart:io';

import 'package:feedtheneed/model/profile.dart';
import 'package:feedtheneed/repositories/user_repository.dart';
import 'package:feedtheneed/screens/navigation.dart';
import 'package:feedtheneed/utils/api_url.dart';
import 'package:feedtheneed/utils/showmessages.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  // final _dobController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  // TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

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
      // debugPrint(user!.picture.toString());
      if (user != null) {
        _firstnameController.text = user!.firstname!;
        _lastnameController.text = user!.lastname!;
        _usernameController.text = user!.username!;
        _addressController.text = user!.address!;
        _phoneController.text = user!.phone!;
        _dobController.text = user!.dob!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 247, 247, 247),

      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Navigation(
                        index: 4,
                      )),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Update Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              // if (user != null)
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.white70, blurRadius: 20.0)
                      ]),
                  child: Stack(
                    children: [
                      SizedBox(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          child: CircleAvatar(
                            radius: 78,
                            backgroundImage: img != null
                                ? FileImage(img!) as ImageProvider
                                : user != null
                                    ? user!.picture == null
                                        ? const NetworkImage(
                                            "https://w.wallhaven.cc/full/v9/wallhaven-v9kw9l.jpg")
                                        : NetworkImage(baseUrl + user!.picture!)
                                    : const NetworkImage(
                                        "https://images.unsplash.com/photo-1614027164847-1b28cfe1df60?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGlvbiUyMGtpbmd8ZW58MHx8MHx8&w=1000&q=80"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.grey[200],
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: const Icon(
                                              Icons.browse_gallery_outlined),
                                          title: const Text('Gallery'),
                                          onTap: () {
                                            _loadImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                              Icons.camera_alt_outlined),
                                          title: const Text('Camera'),
                                          onTap: () {
                                            _loadImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (user != null)
                Text(
                  user!.email!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (user != null)
                Text(
                  user!.username == null ? "____" : "${user!.username}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      key: const ValueKey('fname'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your First name';
                        }
                        return null;
                      },
                      controller: _firstnameController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        // icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter first name.Eg: Jhon',
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
                      height: 20,
                    ),
                    TextFormField(
                      key: const ValueKey('lname'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Last name';
                        }
                        return null;
                      },
                      controller: _lastnameController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter last name.Eg: Snow',
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
                      height: 20, //<-- SEE HERE
                    ),
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Username';
                        }
                        return null;
                      },
                      controller: _usernameController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person_add_alt_1_outlined),
                        hintText: 'What about your username?',
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
                      height: 20, //<-- SEE HERE
                    ),
                    TextFormField(
                      key: const ValueKey('addres'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Address';
                        }
                        return null;
                      },
                      controller: _addressController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.place),
                        hintText: 'What is your Address?',
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
                      height: 20, //<-- SEE HERE
                    ),
                    TextFormField(
                        key: const ValueKey('phone'),
                        controller: _phoneController,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'what is your phone number?',
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
                    const SizedBox(
                      height: 20, //<-- SEE HERE
                    ),
                    TextFormField(
                      // key: const ValueKey('dob'),

                      // controller: _dobController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        //icon of text field
                        hintText: "Enter Date Of Birth",
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
                      controller:
                          _dobController, //editing controller of this TextField

                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            _dobController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          key: const ValueKey('btnUpdate'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xff41A2CD)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                          onPressed: () {
                            if (_globalKey.currentState!.validate()) {
                              UserProfile user = UserProfile(
                                firstname: _firstnameController.text,
                                lastname: _lastnameController.text,
                                username: _usernameController.text,
                                phone: _phoneController.text,
                                address: _addressController.text,
                                dob: _dobController.text,
                              );
                              _updateUser(user);
                            }
                          },
                          child: Text(
                            "Update".toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _updateUser(UserProfile user) async {
    bool isSignUp = await UserRepository().updateUserProfile(user, img);
    _displayMessage(isSignUp);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "updated success");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const Navigation(
                    index: 4,
                  )),
        );
      });
    } else {
      displayErrorMessage(context, "update Failed");
    }
  }

  // void _showToast(BuildContext context) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     const SnackBar(
  //       content: Text(
  //         'Updated Sucessfully',
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }
}
