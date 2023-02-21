import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Walkthrough2Screen extends StatefulWidget {
  const Walkthrough2Screen({Key? key}) : super(key: key);

  @override
  State<Walkthrough2Screen> createState() => _Walkthrough2ScreenState();
}

class _Walkthrough2ScreenState extends State<Walkthrough2Screen> {
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
                    'Who Should Attend',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 7),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            'This Course is specially designed for interventional cardiologists who manage patients with complex challenging coronary anatomy, for example, left main stenosis, bifurcation, lesions chronic total occlusions, multivessel intervention in the presence of impaired left ventricular function, rotational atherectomy as well as structural and peripheral interventions. in addition, interventional and  general cardiology fellows, cath lab nurses technicians and allied health care professionals would also benefit from attending this course.    ',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
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
