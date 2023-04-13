import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:psic_project/Screens/contact_screen.dart';
import 'package:psic_project/Screens/foreign.dart';
import 'package:psic_project/Screens/pakistani.dart';
import 'package:psic_project/Screens/sponsors_test.dart';

class SidebarScreenPage extends StatefulWidget {
  const SidebarScreenPage({Key? key}) : super(key: key);

  @override
  State<SidebarScreenPage> createState() => _SidebarScreenPageState();
}

class _SidebarScreenPageState extends State<SidebarScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: const BoxDecoration(
        color: Color(0xff8e3434),
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          bottomRight: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Pakistani()));
            },
            child: const ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                FontAwesomeIcons.peopleGroup,
                color: Colors.white,
              ),
              title: Text(
                'Faculty (Pakistan)',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Foreign()));
            },
            child: const ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.people_sharp,
                color: Colors.white,
              ),
              title: Text(
                'Faculty (Foreign)',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SponsorsTest()));
            },
            child: const ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                FontAwesomeIcons.handHoldingHeart,
                color: Colors.white,
              ),
              title: Text(
                'Sponsors',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactScreen(
                        title: 'Contact Us',
                        link: 'https://www.psic.org.pk/contact-us/',
                      )));
            },
            child: const ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactScreen(
                    title: 'PSIC Website',
                    link: 'https://www.psic.org.pk/',
                  ),
                ),
              );
            },
            child: const ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.web,
                color: Colors.white,
              ),
              title: Text(
                'PSIC Website',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => contactScreen(
          //           title: 'PSIC Login',
          //           link: 'https://www.psic.org.pk/my-dashboard',
          //         ),
          //       ),
          //     );
          //   },
          //   child: const ListTile(
          //     horizontalTitleGap: 0,
          //     leading: Icon(
          //       Icons.login_outlined,
          //       color: Colors.white,
          //     ),
          //     title: Text(
          //       'PSIC Login',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactScreen(
                    title: 'PJCVI (Journal)',
                    // link: 'https://www.pjcvi.com/index.php/home',
                    link: 'https://pjcvi.com/index.php/ojs',
                  ),
                ),
              );
            },
            child: const ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: Text(
                'PJCVI (Official Journal\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tof PSIC)',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
