import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Walkthrough5Screen extends StatefulWidget {
  const Walkthrough5Screen({Key? key}) : super(key: key);

  @override
  State<Walkthrough5Screen> createState() => _Walkthrough5ScreenState();
}

class _Walkthrough5ScreenState extends State<Walkthrough5Screen> {
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
                  'MESSAGE FROM THE PRESIDENT PSIC',
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
                        padding: const EdgeInsets.only(
                            top: 5, left: 10, right: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            'It is an honor and a pleasure to write this message for the participants of PAK LIVE 2022. This meeting is the flagship conference representing the interventional community of  Pakistan. From its humble beginning in the 90’s,  it has come a long way and can now be compared to any of the top interventional cardiac conferences.\n\nThis year’s meeting agenda is all-encompassing and covers nearly all of the important aspects of contemporary interventional cardiology. This meeting will capture not only the interest of a young fellow early in his training but also the mood and interest of an experienced expert interventional cardiologist.\n\nI hope everyone goes away from this 4 day’s meeting filled with renewed vigor and knowledge relevant to their own practices.\n\nThank you.',
                            style:
                                TextStyle(color: Colors.black, fontSize: 14),
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
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/person.png',
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
                          'Prof Syed Nadeem Hassan Rizvi',
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
                            'MRCP (Lon), FRCP (Edin), FACC, FSCAI, FCPS (Hon) President , PSIC.',
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
