// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

import '../widgets/custom_navigation_bar.dart';
import 'session_detail.dart';

class SessionByTypeDetail extends StatefulWidget {
  SessionByTypeDetail({Key? key, this.day, this.type}) : super(key: key);
  dynamic type;
  dynamic day;

  @override
  State<SessionByTypeDetail> createState() =>
      SessionByTypeDetailState(day: day, type: type);
}

class SessionByTypeDetailState extends State<SessionByTypeDetail> {
  SessionByTypeDetailState({this.type, this.day});

  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  dynamic day;
  dynamic type;
  GlobalKey streamkey = GlobalKey();
  List<HallSessions>? allhallSessions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder<Data?>(
              key: streamkey,
              stream: _sessionByDayController.getData(day).asStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  // snapshot.data?.zero?.dayHalls?.forEach((element) {
                  //   element.hallSessions?.forEach((element) {
                  //     allhallSessions!.add(element);
                  //   });
                  // });
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
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Center(
                                  child: Text(
                                    // 'Sessions by Type',
                                    widget.type,
                                    style: const TextStyle(
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
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible:
                              index <= snapshot.data!.day_1.dayHalls.length,
                          child: Column(
                            children: [
                              // Text(
                              //   '05:15 - 7:00 pm',
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              FutureBuilder<List<HallSessions>>(
                                  future: _sessionByDayController.getTypeData(
                                    day,
                                    type,
                                  ),
                                  builder: (context, snap) {
                                    if (snap.hasData) {
                                      // print(snap.data?.length);
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.74,
                                        child: ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            itemCount: snap.data?.length,
                                            itemBuilder: (context, indexList2) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SessionDetail(
                                                                sessions: snap
                                                                    .data
                                                                    ?.elementAt(
                                                                        indexList2),
                                                                sessionIndex:
                                                                    indexList2,
                                                                allSessionsList:
                                                                    snap.data,
                                                              )));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Column(
                                                    children: [
                                                      // Text(
                                                      //   '${snap.data?.elementAt(indexList2).sessionTime}   (${snap.data?.elementAt(indexList2).session_date})\n',
                                                      //   style: TextStyle(
                                                      //     color: Colors.grey,
                                                      //     fontWeight: FontWeight.w700,
                                                      //   ),
                                                      // ),
                                                      // Text(
                                                      //   '${snap.data?[indexList2].session_hall}\n',
                                                      //   style: TextStyle(
                                                      //     color: Colors.grey,
                                                      //     fontWeight: FontWeight.w700,
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.58.h,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20),
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                spreadRadius: 1,
                                                                blurRadius: 5)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.62.w,
                                                                    child: Text(
                                                                      '${snap.data?.elementAt(indexList2).sessionDate}-${snap.data?.elementAt(indexList2).sessionHall}\n',
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        0),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.3,
                                                                      child:
                                                                          Text(
                                                                        '${snap.data?.elementAt(indexList2).sessionName}\n',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${snap.data?.elementAt(indexList2).sessionTime}\n',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: Text(
                                                                  '${snap.data?.elementAt(indexList2).sessionDetail.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
                                                                  maxLines: 100,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xff8e3434),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
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
                                      );
                                    } else {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                color: Color(0xff8e3434),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                  }),
                              const SizedBox(
                                height: 50,
                              )
                            ],
                          ),
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
