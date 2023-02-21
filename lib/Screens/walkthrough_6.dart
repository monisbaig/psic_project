import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Walkthrough6Screen extends StatefulWidget {
  const Walkthrough6Screen({Key? key}) : super(key: key);

  @override
  State<Walkthrough6Screen> createState() => _Walkthrough6ScreenState();
}

class _Walkthrough6ScreenState extends State<Walkthrough6Screen> {
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
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BottomBar()));
                    },
                    child: const Text(
                      '',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'MESSAGE FROM THE COURSE DIRECTOR',
                  style: TextStyle(
                      color: Color(0xff8e3434),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            'Pakistan Live has developed into one of the most academic meetings in cardiology.  International live case transmissions from all around the globe as well local live transmissions have been the hallmark of this meeting. Focus on the whole cath lab team including nurses, technologists, and interventional cardiology fellows has made Pakistan Live a very unique conference.\n\nThis year we have added several new programs including- How to - Step by Step learning sessions as well training village/hands-on workshops for the most important procedures performed in the cath lab. There will be more focus on case-based discussions in the main program instead of lectures.\n\nCollaboration, active participation, and endorsement by the USA is a great testament to the academic content and quality of the meeting.\nI can assure you that it will be a great learning activity for everyone whether one is a novice or an expert in the field of Interventional cardiology.\nI will be looking forward to welcoming you all to Islamabad.\n\nThank you',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.28,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/person1.png',
                                ),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: const [
                        Text(
                          'Dr. Bashir Hanif',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const Text(
                            'MD, FACC, FSCAI\nCourse Director Pakistan Live 2022',
                            style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
