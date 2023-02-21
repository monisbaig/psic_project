import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Walkthrough4Screen extends StatefulWidget {
  const Walkthrough4Screen({Key? key}) : super(key: key);

  @override
  State<Walkthrough4Screen> createState() => _Walkthrough4ScreenState();
}

class _Walkthrough4ScreenState extends State<Walkthrough4Screen> {
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
                  height: MediaQuery.of(context).size.height * 0.15,
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
                    'Collaborating Countries',
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
                    children: [
                      Image.asset(
                        'icons/flags/png/us.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('USA'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'icons/flags/png/gb.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('UK'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'icons/flags/png/cn.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('China'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'icons/flags/png/tr.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Türkiye'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'icons/flags/png/sa.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Saudi Arabia'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'icons/flags/png/my.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Malaysia'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'icons/flags/png/eg.png',
                        package: 'country_icons',
                        height: 30,
                        width: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Egypt'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 30,
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/singapore.jpg'))),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 7),
                        child: Text('Singapore'),
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
