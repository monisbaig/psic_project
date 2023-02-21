import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Walkthrough1Screen extends StatefulWidget {
  const Walkthrough1Screen({Key? key}) : super(key: key);

  @override
  State<Walkthrough1Screen> createState() => _Walkthrough1ScreenState();
}

class _Walkthrough1ScreenState extends State<Walkthrough1Screen> {
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
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset('assets/images/log.jpg')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage('assets/images/psic_poster.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  Text(
                    'Conference Highlights',
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
                        padding: EdgeInsets.only(top: 10, left: 7),
                        child: Text(
                            'International & National live cases of Coronary \nPeripheral and Structure Heart Interventions'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                        child: Text('Workshops for Hands on Training '),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                        child: Text('State of the art lectures '),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                        child: Text('Fellows Courses'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                        child: Text('Nurses and Technologists Symposium'),
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
