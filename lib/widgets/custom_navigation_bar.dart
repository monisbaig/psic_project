import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Screens/contact_screen.dart';
import '../Screens/home_sceen.dart';

class CustomNavigationBar extends StatefulWidget {
  final bool onDashboardResponse;
  final bool onHomeResponse;

  const CustomNavigationBar({
    Key? key,
    this.onDashboardResponse = false,
    this.onHomeResponse = false,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => CustomNavigationBarState();
}

class CustomNavigationBarState extends State<CustomNavigationBar> {
  var _enteredUsername = '';
  var _enteredComment = '';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? selectedHall;
  List<String> halls = [
    'Hall A',
    'Hall B',
    'Hall C',
  ];

  void _onSubmit() {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      FocusScope.of(context).unfocus();
      var uID = DateTime.now().microsecondsSinceEpoch.toString();
      FirebaseFirestore.instance.collection('users').doc(uID).set({
        'username': _enteredUsername,
        'comments': _enteredComment,
        'hall': selectedHall,
        'createdAt': DateTime.now(),
        'sent': false,
        'uId': uID,
      });
      _usernameController.clear();
      _commentController.clear();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Comment Sent Successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: widget.onDashboardResponse == false
                            ? () {
                                setState(() {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ContactScreen(
                                        title: 'PSIC Login',
                                        link:
                                            'https://www.psic.org.pk/my-dashboard',
                                      ),
                                    ),
                                  );
                                });
                              }
                            : () {},
                        child: const ImageIcon(
                          AssetImage('assets/images/dashboard.png'),
                          color: Color(0xff8e3434),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: widget.onHomeResponse == false
                            ? () {
                                setState(() {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreenPage(),
                                    ),
                                  );
                                });
                              }
                            : () {},
                        child: const ImageIcon(
                          AssetImage('assets/images/home select icon.png'),
                          color: Color(0xff8e3434),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: const Color(0xff8e3434),
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Interact:'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              actions: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _usernameController,
                                        decoration: const InputDecoration(
                                          hintText: 'Your name',
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _enteredUsername = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        controller: _commentController,
                                        decoration: const InputDecoration(
                                          hintText: 'Comments',
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your comment';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _enteredComment = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      DropdownButtonFormField(
                                        borderRadius: BorderRadius.circular(12),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select hall first';
                                          }
                                          return null;
                                        },
                                        hint: const Text('Select Hall'),
                                        value: selectedHall,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedHall = value!;
                                          });
                                        },
                                        items: halls.map((e) {
                                          return DropdownMenuItem(
                                            alignment: Alignment.center,
                                            value: e,
                                            child: Text(e),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          Colors.red,
                                        ),
                                      ),
                                      child: const Text('Cancel'),
                                    ),
                                    SizedBox(width: 8.w),
                                    ElevatedButton(
                                      onPressed: () {
                                        _onSubmit();
                                      },
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          );
                        },
                        child: const ImageIcon(
                          AssetImage('assets/images/interact.png'),
                          color: Color(0xff8e3434),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Interact',
                    style: TextStyle(
                      color: const Color(0xff8e3434),
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
