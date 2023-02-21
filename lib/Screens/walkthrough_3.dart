import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Walkthrough3Screen extends StatefulWidget {
  const Walkthrough3Screen({Key? key}) : super(key: key);

  @override
  State<Walkthrough3Screen> createState() => _Walkthrough3ScreenState();
}

class _Walkthrough3ScreenState extends State<Walkthrough3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BottomBar()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset('assets/images/log.jpg')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/psic_poster.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: const [
                  Text(
                    'Course Directors',
                    style: TextStyle(
                      color: Color(0xff8e3434),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Bashir Hanif'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Amber Malik'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Tahir Saghir'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Associate Course Director ',
                          style: TextStyle(
                            color: Color(0xff8e3434),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Arslan Masood'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: const [
                        Text(
                          'Foreign Course Directors ',
                          style: TextStyle(
                            color: Color(0xff8e3434),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Omer Goktekin'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Rosli Mohammad Ali'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Shao Liang Chen'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Ehtisham Mahmud'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Rajesh Dave'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff8e3434),
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Javed Ahmed'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
