import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/Screens/session_detail.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

import '../widgets/custom_navigation_bar.dart';

class SessionByDayScreenPage extends StatefulWidget {
  const SessionByDayScreenPage({Key? key}) : super(key: key);

  @override
  State<SessionByDayScreenPage> createState() => _SessionByDayScreenPageState();
}

class _SessionByDayScreenPageState extends State<SessionByDayScreenPage> {
  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  var day = 'day_1';
  GlobalKey streamKey = GlobalKey();

  @override
  initState() {
    super.initState();
  }

  double tabHeight = 320.h;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavigationBar(),
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: SizedBox(
          child: SingleChildScrollView(
            child: StreamBuilder<Data?>(
              key: streamKey,
              stream: _sessionByDayController.getData(day).asStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  // print(snapshot.data!.eventDates);
                  // print(snapshot.data!.eventDates
                  //     .toString()
                  //     .replaceRange(0, 12, ''));
                  // print(DateTime.now());
                  // print('hello${snapshot.data!.day_1.dayDate}');
                  // DateTime firstdate = DateFormat.yMMMMd('en_US')
                  //     .parse(snapshot.data!.day_1.dayDate.toString());
                  // var year=snapshot.data!.eventDates.toString().replaceRange(0,12,'');
                  // var  start=snapshot.data!.eventDates.toString().replaceRange(2,16,'');
                  // var  end=snapshot.data!.eventDates.toString().replaceRange(0,5,'').replaceRange(3,11,'');
                  // var  month=snapshot.data!.eventDates.toString().replaceRange(0,8,'').replaceRange(4,8,'');
                  //
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Stack(
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
                                padding: EdgeInsets.only(
                                  right: 0,
                                  top: 5,
                                ),
                                child: Center(
                                  child: Text(
                                    'Session Data',
                                    textAlign: TextAlign.center,
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
                        SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data!.eventDates.substring(8),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text('Thur'),
                                    Text('Fri'),
                                    Text('Sat'),
                                    Text('Sun'),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        index = 0;
                                        setState(() {
                                          streamKey.currentState!.reassemble();
                                          day = "day_1";
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: day == 'day_1'
                                                ? const Color(0xff8e3434)
                                                : Colors.transparent),
                                        child: Text(
                                          snapshot.data?.day_1.dayDate
                                                  .replaceAll(',', '')
                                                  .split(' ')
                                                  .toList()
                                                  .elementAt(1)
                                                  .toString() ??
                                              '',
                                          style: TextStyle(
                                              color: day == 'day_1'
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        index = 0;
                                        setState(() {
                                          streamKey.currentState!.reassemble();
                                          day = "day_2";
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: day == 'day_2'
                                                ? const Color(0xff8e3434)
                                                : Colors.transparent),
                                        child: Text(
                                          snapshot.data?.day_2.dayDate
                                                  .replaceAll(',', '')
                                                  .split(' ')
                                                  .toList()
                                                  .elementAt(1)
                                                  .toString() ??
                                              '',
                                          style: TextStyle(
                                              color: day == 'day_2'
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        index = 0;
                                        setState(() {
                                          streamKey.currentState!.reassemble();
                                          day = "day_3";
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: day == 'day_3'
                                                ? const Color(0xff8e3434)
                                                : Colors.transparent),
                                        child: Text(
                                          snapshot.data?.day_3.dayDate
                                                  .replaceAll(',', '')
                                                  .split(' ')
                                                  .toList()
                                                  .elementAt(1)
                                                  .toString() ??
                                              '',
                                          style: TextStyle(
                                              color: day == 'day_3'
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        index = 0;
                                        setState(() {
                                          streamKey.currentState!.reassemble();
                                          day = "day_4";
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: day == 'day_4'
                                                ? const Color(0xff8e3434)
                                                : Colors.transparent),
                                        child: Text(
                                          snapshot.data?.day_4.dayDate
                                                  .replaceAll(',', '')
                                                  .split(' ')
                                                  .toList()
                                                  .elementAt(1)
                                                  .toString() ??
                                              '',
                                          style: TextStyle(
                                              color: day == 'day_4'
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        if (day == 'day_1')
                          Container(
                            // height: snapshot.data!.day_1.dayHalls.length <= 3
                            //     ? 55
                            //     : 100,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.05),
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data?.day_1.dayHalls.length ?? 0,
                              itemBuilder: (context, indexList) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = indexList;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45.w,
                                    decoration: BoxDecoration(
                                      color: index == indexList
                                          ? const Color(0xff8e3434)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data?.day_1.dayHalls
                                                .elementAt(indexList)
                                                .hallName ??
                                            '',
                                        style: TextStyle(
                                          color: index != indexList
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                childAspectRatio: 0.75,
                              ),
                            ),
                          ),
                        if (day == 'day_2')
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.05),
                            ),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.data?.day_2.dayHalls.length ?? 0,
                              itemBuilder: (context, indexList) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = indexList;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45.w,
                                    decoration: BoxDecoration(
                                      color: index == indexList
                                          ? const Color(0xff8e3434)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data?.day_2.dayHalls
                                                .elementAt(indexList)
                                                .hallName ??
                                            '',
                                        style: TextStyle(
                                          color: index != indexList
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                childAspectRatio: 0.75,
                              ),
                            ),
                          ),
                        if (day == 'day_3')
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.05),
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data?.day_3.dayHalls.length ?? 0,
                              itemBuilder: (context, indexList) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = indexList;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45.w,
                                    decoration: BoxDecoration(
                                      color: index == indexList
                                          ? const Color(0xff8e3434)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data?.day_3.dayHalls
                                                .elementAt(indexList)
                                                .hallName ??
                                            '',
                                        style: TextStyle(
                                          color: index != indexList
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                childAspectRatio: 0.75,
                              ),
                            ),
                          ),
                        if (day == 'day_4')
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.05),
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data?.day_4.dayHalls.length ?? 0,
                              itemBuilder: (context, indexList) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = indexList;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45.w,
                                    decoration: BoxDecoration(
                                      color: index == indexList
                                          ? const Color(0xff8e3434)
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data?.day_4.dayHalls
                                                .elementAt(indexList)
                                                .hallName ??
                                            '',
                                        style: TextStyle(
                                          color: index != indexList
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 50,
                                childAspectRatio: 0.75,
                              ),
                            ),
                          ),
                        SizedBox(height: 5.h),
                        if (day == 'day_1')
                          snapshot.data?.day_1.dayHalls == null &&
                                  snapshot.data?.day_1.dayHalls
                                          .elementAt(index)
                                          .hallSessions ==
                                      null
                              ? const SizedBox()
                              : SizedBox(
                                  // height: 360.h,
                                  width: double.maxFinite,
                                  child: Visibility(
                                    visible: index <=
                                        snapshot.data!.day_1.dayHalls.length,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5.h),
                                        Visibility(
                                          visible: snapshot.data!.day_1.dayHalls
                                              .elementAt(index)
                                              .hallDetail
                                              .toString()
                                              .isNotEmpty,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.black12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data?.day_1.dayHalls.elementAt(index).hallDetail ?? ''}\n',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // height: tabHeight,
                                          // (snapshot.data?.day_1.dayHalls.length ??
                                          //             0) >
                                          //         2
                                          //     ? MediaQuery.of(context).size.height *
                                          //         0.4.h
                                          //     : MediaQuery.of(context).size.height *
                                          //         0.20.h,
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                // padding:
                                                //     const EdgeInsets.only(bottom: 20),
                                                itemCount: snapshot
                                                    .data?.day_1.dayHalls
                                                    .elementAt(index)
                                                    .hallSessions
                                                    .length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  return Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          try {
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                                  return SessionDetail(
                                                                    sessions: snapshot
                                                                        .data!
                                                                        .day_1
                                                                        .dayHalls
                                                                        .elementAt(
                                                                            index)
                                                                        .hallSessions
                                                                        .elementAt(
                                                                            indexList2),
                                                                    hallIndex:
                                                                        index,
                                                                    sessionIndex:
                                                                        indexList2,
                                                                    allSessionsList: snapshot
                                                                        .data!
                                                                        .day_1
                                                                        .dayHalls
                                                                        .elementAt(
                                                                            index)
                                                                        .hallSessions,
                                                                    comingFrom: snapshot
                                                                        .data!
                                                                        .day_1
                                                                        .dayHalls
                                                                        .elementAt(
                                                                            index)
                                                                        .hallSessions
                                                                        .elementAt(
                                                                            indexList2)
                                                                        .sessionName
                                                                        .toString()
                                                                        .toLowerCase(),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          } catch (e) {
                                                            print(e);
                                                          }
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.82.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                spreadRadius: 1,
                                                                blurRadius: 5,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      5.h),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.h),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                /// Fahad changes
                                                                // Padding(
                                                                //   padding: EdgeInsets
                                                                //       .symmetric(
                                                                //           horizontal:
                                                                //               20.w),
                                                                //   child: Row(
                                                                //     crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .start,
                                                                //     mainAxisAlignment:
                                                                //         MainAxisAlignment
                                                                //             .spaceBetween,
                                                                //     children: [
                                                                //       SizedBox(
                                                                //         width: MediaQuery.of(context).size.width *
                                                                //             0.48.w,
                                                                //         child:
                                                                //             Text(
                                                                //           '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay ?? ''}${'-> '}${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall ?? ''}\n',
                                                                //           style:
                                                                //               TextStyle(
                                                                //             color:
                                                                //                 const Color(0xff8e3434),
                                                                //             fontSize:
                                                                //                 14.sp,
                                                                //             fontWeight:
                                                                //                 FontWeight.w700,
                                                                //           ),
                                                                //         ),
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              20.w),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.48.w,
                                                                        child:
                                                                            Text(
                                                                          '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName ?? ''}\n',
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
                                                                        '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime ?? ''}\n',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          20.w,
                                                                      vertical:
                                                                          5.h),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => SessionDetail(
                                                                                sessions: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                hallIndex: index,
                                                                                sessionIndex: indexList2,
                                                                                allSessionsList: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions,
                                                                              )));
                                                                    },
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) => SessionDetail(
                                                                                  sessions: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                  hallIndex: index,
                                                                                  sessionIndex: indexList2,
                                                                                  allSessionsList: snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions,
                                                                                )));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('<br />\r\n<br />\r\n<br />\r\n', '').replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '').trim() ??
                                                                            '',
                                                                        maxLines:
                                                                            100,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff8e3434),
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ),
                                        SizedBox(height: 6.h)
                                      ],
                                    ),
                                  ),
                                ),
                        if (day == 'day_2')
                          snapshot.data?.day_2.dayHalls == null &&
                                  snapshot.data?.day_2.dayHalls
                                          .elementAt(index)
                                          .hallSessions ==
                                      null
                              ? const SizedBox()
                              : SizedBox(
                                  // height: 360.h,
                                  width: double.maxFinite,
                                  child: Visibility(
                                    visible: index <=
                                        snapshot.data!.day_2.dayHalls.length,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5.h),
                                        Visibility(
                                          visible: snapshot.data!.day_2.dayHalls
                                              .elementAt(index)
                                              .hallDetail
                                              .toString()
                                              .isNotEmpty,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.black12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data?.day_2.dayHalls.elementAt(index).hallDetail ?? ''}\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // height: tabHeight,
                                          // (snapshot.data?.day_2.dayHalls.length ??
                                          //             0) >
                                          //         2
                                          //     ? MediaQuery.of(context).size.height *
                                          //         0.4.h
                                          //     : MediaQuery.of(context).size.height *
                                          //         0.20.h,
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                // padding:
                                                //     const EdgeInsets.only(bottom: 20),
                                                itemCount: snapshot
                                                    .data?.day_2.dayHalls
                                                    .elementAt(index)
                                                    .hallSessions
                                                    .length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  return Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          try {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SessionDetail(
                                                                              sessions: snapshot.data!.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                              hallIndex: index,
                                                                              sessionIndex: indexList2,
                                                                              allSessionsList: snapshot.data!.day_2.dayHalls.elementAt(index).hallSessions,
                                                                              comingFrom: snapshot.data!.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName.toString().toLowerCase(),
                                                                            )));
                                                          } catch (e) {
                                                            print(e);
                                                          }
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.82.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                spreadRadius: 1,
                                                                blurRadius: 5,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      5.h),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.h),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Padding(
                                                                //   padding: EdgeInsets
                                                                //       .symmetric(
                                                                //           horizontal:
                                                                //               20.w),
                                                                //   child: Row(
                                                                //     crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .start,
                                                                //     mainAxisAlignment:
                                                                //         MainAxisAlignment
                                                                //             .spaceBetween,
                                                                //     children: [
                                                                //       SizedBox(
                                                                //         width: MediaQuery.of(context).size.width *
                                                                //             0.48.w,
                                                                //         child:
                                                                //             Text(
                                                                //           '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay ?? ''}${'-> '}${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall ?? ''}\n',
                                                                //           style:
                                                                //               TextStyle(
                                                                //             color:
                                                                //                 const Color(0xff8e3434),
                                                                //             fontSize:
                                                                //                 14.sp,
                                                                //             fontWeight:
                                                                //                 FontWeight.w700,
                                                                //           ),
                                                                //         ),
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              20.w),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.48.w,
                                                                        child:
                                                                            Text(
                                                                          '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName ?? ''}\n',
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
                                                                        '${snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime ?? ''}\n',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          20.w,
                                                                      vertical:
                                                                          10.h),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => SessionDetail(
                                                                                sessions: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                hallIndex: index,
                                                                                sessionIndex: indexList2,
                                                                                allSessionsList: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions,
                                                                              )));
                                                                    },
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) => SessionDetail(
                                                                                  sessions: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                  hallIndex: index,
                                                                                  sessionIndex: indexList2,
                                                                                  allSessionsList: snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions,
                                                                                )));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        snapshot.data?.day_2.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('<br />\r\n<br />\r\n', '').replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<',
                                                                                '') ??
                                                                            '',
                                                                        maxLines:
                                                                            100,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff8e3434),
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ),
                                        SizedBox(height: 6.h)
                                      ],
                                    ),
                                  ),
                                ),
                        if (day == 'day_3')
                          snapshot.data?.day_3.dayHalls == null &&
                                  snapshot.data?.day_3.dayHalls
                                          .elementAt(index)
                                          .hallSessions ==
                                      null
                              ? const SizedBox()
                              : SizedBox(
                                  // height: 360.h,
                                  width: double.maxFinite,
                                  child: Visibility(
                                    visible: index <=
                                        snapshot.data!.day_3.dayHalls.length,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5.h),
                                        Visibility(
                                          visible: snapshot.data!.day_3.dayHalls
                                              .elementAt(index)
                                              .hallDetail
                                              .toString()
                                              .isNotEmpty,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.black12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data?.day_3.dayHalls.elementAt(index).hallDetail ?? ''}\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // height: tabHeight,
                                          // (snapshot.data?.day_3.dayHalls.length ??
                                          //             0) >
                                          //         2
                                          //     ? MediaQuery.of(context).size.height *
                                          //         0.4.h
                                          //     : MediaQuery.of(context).size.height *
                                          //         0.20.h,
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                // padding:
                                                //     const EdgeInsets.only(bottom: 20),
                                                itemCount: snapshot
                                                    .data?.day_3.dayHalls
                                                    .elementAt(index)
                                                    .hallSessions
                                                    .length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  return Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          try {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SessionDetail(
                                                                              sessions: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                              hallIndex: index,
                                                                              sessionIndex: indexList2,
                                                                              allSessionsList: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions,
                                                                              comingFrom: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName.toString().toLowerCase(),
                                                                            )));
                                                          } catch (e) {
                                                            print(e);
                                                          }
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.82.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                spreadRadius: 1,
                                                                blurRadius: 5,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      5.h),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.h),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // Padding(
                                                                //   padding: EdgeInsets
                                                                //       .symmetric(
                                                                //           horizontal:
                                                                //               20.w),
                                                                //   child: Row(
                                                                //     crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .start,
                                                                //     mainAxisAlignment:
                                                                //         MainAxisAlignment
                                                                //             .spaceBetween,
                                                                //     children: [
                                                                //       SizedBox(
                                                                //         width: MediaQuery.of(context).size.width *
                                                                //             0.48.w,
                                                                //         child:
                                                                //             Text(
                                                                //           '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay ?? ''}${'-> '}${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall ?? ''}\n',
                                                                //           style:
                                                                //               TextStyle(
                                                                //             color:
                                                                //                 const Color(0xff8e3434),
                                                                //             fontSize:
                                                                //                 14.sp,
                                                                //             fontWeight:
                                                                //                 FontWeight.w700,
                                                                //           ),
                                                                //         ),
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              20.w),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.48.w,
                                                                        child:
                                                                            Text(
                                                                          '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName ?? ''}\n',
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
                                                                        '${snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime ?? ''}\n',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          20.w,
                                                                      vertical:
                                                                          10.h),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => SessionDetail(
                                                                                sessions: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                hallIndex: index,
                                                                                sessionIndex: indexList2,
                                                                                allSessionsList: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions,
                                                                              )));
                                                                    },
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) => SessionDetail(
                                                                                  sessions: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                  hallIndex: index,
                                                                                  sessionIndex: indexList2,
                                                                                  allSessionsList: snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions,
                                                                                )));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        snapshot.data?.day_3.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('<br />\r\n<br />\r\n<br />\r\n<br />\r\n', '').replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '').trim() ??
                                                                            '',
                                                                        maxLines:
                                                                            100,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff8e3434),
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ),
                                        SizedBox(height: 6.h)
                                      ],
                                    ),
                                  ),
                                ),
                        if (day == 'day_4')
                          snapshot.data?.day_4.dayHalls == null &&
                                  snapshot.data?.day_4.dayHalls
                                          .elementAt(index)
                                          .hallSessions ==
                                      null
                              ? const SizedBox()
                              : SizedBox(
                                  // height: 360.h,
                                  width: double.maxFinite,
                                  child: Visibility(
                                    visible: index <=
                                        snapshot.data!.day_4.dayHalls.length,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 5.h),
                                        Visibility(
                                          visible: snapshot.data!.day_4.dayHalls
                                              .elementAt(index)
                                              .hallDetail
                                              .toString()
                                              .isNotEmpty,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.black12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data?.day_4.dayHalls.elementAt(index).hallDetail ?? ''}\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // height: tabHeight,
                                          // (snapshot.data?.day_4.dayHalls.length ??
                                          //             0) >
                                          //         2
                                          //     ? MediaQuery.of(context).size.height *
                                          //         0.4.h
                                          //     : MediaQuery.of(context).size.height *
                                          //         0.20.h,
                                          child: MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                // padding:
                                                //     const EdgeInsets.only(bottom: 20),
                                                itemCount: snapshot
                                                    .data?.day_4.dayHalls
                                                    .elementAt(index)
                                                    .hallSessions
                                                    .length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  return Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          try {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SessionDetail(
                                                                              sessions: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                              hallIndex: index,
                                                                              sessionIndex: indexList2,
                                                                              allSessionsList: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions,
                                                                              comingFrom: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName.toString().toLowerCase(),
                                                                            )));
                                                          } catch (e) {
                                                            print(e);
                                                          }
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.82.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                spreadRadius: 1,
                                                                blurRadius: 5,
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      5.h),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.h),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                /// Fahad changes
                                                                // Padding(
                                                                //   padding: EdgeInsets
                                                                //       .symmetric(
                                                                //           horizontal:
                                                                //               20.w),
                                                                //   child: Row(
                                                                //     crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .start,
                                                                //     mainAxisAlignment:
                                                                //         MainAxisAlignment
                                                                //             .spaceBetween,
                                                                //     children: [
                                                                //       SizedBox(
                                                                //         width: MediaQuery.of(context).size.width *
                                                                //             0.48.w,
                                                                //         child:
                                                                //             Text(
                                                                //           '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDay ?? ''}${'-> '}${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionHall ?? ''}\n',
                                                                //           style:
                                                                //               TextStyle(
                                                                //             color:
                                                                //                 const Color(0xff8e3434),
                                                                //             fontSize:
                                                                //                 14.sp,
                                                                //             fontWeight:
                                                                //                 FontWeight.w700,
                                                                //           ),
                                                                //         ),
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              20.w),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.48.w,
                                                                        child:
                                                                            Text(
                                                                          '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionName ?? ''}\n',
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
                                                                        '${snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTime ?? ''}\n',
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Colors.grey,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          20.w,
                                                                      vertical:
                                                                          10.h),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => SessionDetail(
                                                                                sessions: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                hallIndex: index,
                                                                                sessionIndex: indexList2,
                                                                                allSessionsList: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions,
                                                                              )));
                                                                    },
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) => SessionDetail(
                                                                                  sessions: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2),
                                                                                  hallIndex: index,
                                                                                  sessionIndex: indexList2,
                                                                                  allSessionsList: snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions,
                                                                                )));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        snapshot.data?.day_4.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionDetail.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '').trim() ??
                                                                            '',
                                                                        maxLines:
                                                                            100,
                                                                        style:
                                                                            const TextStyle(
                                                                          color:
                                                                              Color(0xff8e3434),
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ),
                                        SizedBox(height: 6.h)
                                      ],
                                    ),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
