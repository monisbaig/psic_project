import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

import '../widgets/custom_navigation_bar.dart';
import 'session_detail.dart';

class WorkShopScreenPage extends StatefulWidget {
  const WorkShopScreenPage({Key? key}) : super(key: key);

  @override
  State<WorkShopScreenPage> createState() => _WorkShopScreenPageState();
}

class _WorkShopScreenPageState extends State<WorkShopScreenPage> {
  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  var day = '0';
  GlobalKey streamkey = GlobalKey();
  List<HallSessions>? allhallSessions = [];
  var current = 1;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<HallSessions>>(
              key: streamkey,
              future: _sessionByDayController.getVillageData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              const Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Center(
                                  child: Text(
                                    'Training Villages',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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

                            // SizedBox(
                            //   height:MediaQuery.of(context).size.height*0.01,
                            // ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, indexList2) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SessionDetail(
                                                      sessions: snapshot.data
                                                          ?.elementAt(
                                                              indexList2),
                                                      sessionIndex: indexList2,
                                                      allSessionsList:
                                                          snapshot.data,
                                                      comingFrom:
                                                          "training villages",
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   '${snapshot.data?.elementAt(indexList2).sessionTime}   (${snapshot.data?.elementAt(indexList2).session_date})\n',
                                            //   style: TextStyle(
                                            //     color: Colors.grey,
                                            //     fontWeight: FontWeight.w700,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   '${snapshot.data?.elementAt(indexList2).session_hall}\n',
                                            //   style: TextStyle(
                                            //     color: Colors.grey,
                                            //     fontWeight: FontWeight.w700,
                                            //   ),
                                            // ),
                                            Container(
                                              padding: const EdgeInsets.all(20),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7.h,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade400,
                                                      spreadRadius: 1,
                                                      blurRadius: 5)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          child: Text(
                                                            '${snapshot.data?.elementAt(indexList2).sessionDate}-${snapshot.data?.elementAt(indexList2).sessionHall}\n',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          child: Text(
                                                            '${snapshot.data?.elementAt(indexList2).sessionName}\n',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${snapshot.data?.elementAt(indexList2).sessionTime}\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Text(
                                                        '${snapshot.data?.elementAt(indexList2).sessionDetail.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
                                                        maxLines: 100,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff8e3434),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SessionDetail(
                                                                              sessions: snapshot.data?.elementAt(indexList2),
                                                                              sessionIndex: indexList2,
                                                                              allSessionsList: snapshot.data,
                                                                              comingFrom: "training villages",
                                                                            )));
                                                          },
                                                          child: const Text(
                                                            '\nMust register to attend',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                              color: Color(0xff8e3434)),
                        )
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
