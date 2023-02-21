import 'package:flutter/material.dart';
import 'package:psic_project/Screens/home_sceen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);


  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  static var index = 0;
  List pages = [
    const HomeScreenPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(index),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          index == 0
              ? InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreenPage()));
                    });
                  },
                  child: const ImageIcon(
                      AssetImage('assets/images/home select icon.png')))
              : InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreenPage()));
                    });
                  },
                  child: const ImageIcon(AssetImage('assets/images/home icon.png'))),
        ],
      ),
    );
  }
}
