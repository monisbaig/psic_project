import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  int index = 0;
  // final SessionByDayController _sessionByDayController = SessionByDayController();
  var day = '0';
  var type = '';
  GlobalKey streamKey = GlobalKey();
  List<HallSessions>? allHallSessions = [];
  List spons = [
    'Main Sponsors',
    'Other Sponsors',
  ];
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                    const Text(
                      'Sponsors',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  // Text(
                  //   '05:15 - 7:00 pm',
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.05),
                    ),
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        itemCount: spons.length,
                        itemBuilder: (context, indexlist) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                index = indexlist;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                color: index == indexlist
                                    ? const Color(0xff8e3434)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                spons.elementAt(indexlist).toString(),
                                style: TextStyle(
                                  color: index != indexlist
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                childAspectRatio: 0.75)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount:
                            jsonDecode(jsondata)['event_sponsors'].length ?? 0,
                        itemBuilder: (context, indexList2) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.43,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 5)
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                '${index != 0 ? jsonDecode(jsondata)['event_sponsors']['general_sponsors'].elementAt(indexList2)['logo'] : jsonDecode(jsondata)['event_sponsors']['platinum_sponsors'].elementAt(indexList2)['logo']}',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${index != 0 ? jsonDecode(jsondata)['event_sponsors']['general_sponsors'].elementAt(indexList2)['name'] : jsonDecode(jsondata)['event_sponsors']['platinum_sponsors'].elementAt(indexList2)['name']}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
