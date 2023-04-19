import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/controller/program_controller.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_navigation_bar.dart';

class ProgramScreenPage extends StatefulWidget {
  const ProgramScreenPage({Key? key}) : super(key: key);

  @override
  State<ProgramScreenPage> createState() => _ProgramScreenPageState();
}

class _ProgramScreenPageState extends State<ProgramScreenPage> {
  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  SqliteService service = SqliteService();
  GlobalKey streamKey = GlobalKey();
  var day = 'day_1';
  var current = 1;
  @override
  initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavigationBar(),
      body: SafeArea(
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
                  // print('hello$firstdate');
                  return Padding(
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
                                'My Programs',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_back,
                                color: Colors.transparent,
                                size: 30,
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
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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
                        SizedBox(height: 10.h),

                        if (day == 'day_1')
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            width: double.maxFinite,
                            child: Visibility(
                              visible:
                                  index <= snapshot.data!.day_1.dayHalls.length,
                              child: Column(
                                children: [
                                  // const SizedBox(height: 10),
                                  Visibility(
                                    visible: snapshot.data!.day_1.dayHalls
                                        .elementAt(index)
                                        .hallDetail
                                        .toString()
                                        .isNotEmpty,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data?.day_1
                                                            .dayHalls
                                                            .elementAt(index)
                                                            .hallDetail ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
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
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height *
                                  //         0.01),
                                  FutureBuilder<List<Sessions>>(
                                      future: service.getItems(),
                                      builder: (context, mysavedData) {
                                        List<String> sessions = [];
                                        for (var element in snapshot
                                            .data!.day_1.dayHalls
                                            .elementAt(index)
                                            .hallSessions) {
                                          sessions.add(element.sessionDetail
                                              .toString()
                                              .toLowerCase()
                                              .toString()
                                              .replaceAll('br', '')
                                              .replaceAll('br', '')
                                              .replaceAll('>', '')
                                              .replaceAll('/', '')
                                              .replaceAll('<', ''));
                                        }
                                        if (mysavedData.hasData) {
                                          return SizedBox(
                                            // height: MediaQuery.of(context)
                                            //         .size
                                            //         .height *
                                            //     0.53,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                itemCount:
                                                    mysavedData.data?.length ??
                                                        0,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  if (mysavedData.hasData) {
                                                    if (sessions.contains(
                                                        mysavedData.data!
                                                            .elementAt(
                                                                indexList2)
                                                            .description
                                                            .toString()
                                                            .toLowerCase()
                                                            .toString()
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll('>', '')
                                                            .replaceAll('/', '')
                                                            .replaceAll(
                                                                '<', ''))) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.43.sh,
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          5)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
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
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.5.w,
                                                                          child:
                                                                              Text(
                                                                            snapshot.data?.day_1.dayHalls.elementAt(index).hallName ??
                                                                                '',
                                                                            // '${snapshot.data?.day_1.dayHalls.elementAt(index).hallSessions.elementAt(indexList2).sessionTimeSlots.elementAt(index).title.toString().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          mysavedData.data?.elementAt(indexList2).caseTime ??
                                                                              '',
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
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.8,
                                                                            child:
                                                                                Text(
                                                                              mysavedData.data?.elementAt(indexList2).description ?? '',
                                                                              style: const TextStyle(
                                                                                color: Color(0xff8e3434),
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Divider(
                                                                        color: Colors
                                                                            .black12,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            SqliteService
                                                                                service =
                                                                                SqliteService();
                                                                            service.deleteItem(mysavedData.data?.elementAt(indexList2).caseName.toString().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<',
                                                                                ''));

                                                                            setState(() {
                                                                              initialIndex = 0;
                                                                            });

                                                                            SharedPreferences
                                                                                prefs =
                                                                                await SharedPreferences.getInstance();
                                                                            prefs.setBool('setProgram',
                                                                                false);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.05,
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.4,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: const Color(0xff8e3434),
                                                                            ),
                                                                            child:
                                                                                const Center(
                                                                              child: Text(
                                                                                'Remove',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
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
                                                      );
                                                    } else {
                                                      return Container();
                                                    }
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ),

                        if (day == 'day_2')
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            width: double.maxFinite,
                            child: Visibility(
                              visible:
                                  index <= snapshot.data!.day_2.dayHalls.length,
                              child: Column(
                                children: [
                                  // const SizedBox(height: 10),
                                  Visibility(
                                    visible: snapshot.data!.day_2.dayHalls
                                        .elementAt(index)
                                        .hallDetail
                                        .toString()
                                        .isNotEmpty,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data?.day_2
                                                            .dayHalls
                                                            .elementAt(index)
                                                            .hallDetail ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
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
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height *
                                  //         0.01),
                                  FutureBuilder<List<Sessions>>(
                                      future: service.getItems(),
                                      builder: (context, mysavedData) {
                                        List<String> sessions = [];
                                        for (var element in snapshot
                                            .data!.day_2.dayHalls
                                            .elementAt(index)
                                            .hallSessions) {
                                          sessions.add(element.sessionDetail
                                              .toString()
                                              .toLowerCase()
                                              .toString()
                                              .replaceAll('br', '')
                                              .replaceAll('br', '')
                                              .replaceAll('>', '')
                                              .replaceAll('/', '')
                                              .replaceAll('<', ''));
                                        }
                                        if (mysavedData.hasData) {
                                          return SizedBox(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                itemCount:
                                                    mysavedData.data!.length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  if (mysavedData.hasData) {
                                                    if (sessions.contains(
                                                        mysavedData.data!
                                                            .elementAt(
                                                                indexList2)
                                                            .description
                                                            .toString()
                                                            .toLowerCase()
                                                            .toString()
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll('>', '')
                                                            .replaceAll('/', '')
                                                            .replaceAll(
                                                                '<', ''))) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.43.sh,
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          5)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
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
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.5.w,
                                                                          child:
                                                                              Text(
                                                                            snapshot.data?.day_2.dayHalls.elementAt(index).hallName ??
                                                                                '',
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          mysavedData.data?.elementAt(indexList2).caseTime ??
                                                                              '',
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
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.8,
                                                                            child:
                                                                                Text(
                                                                              mysavedData.data?.elementAt(indexList2).description ?? '',
                                                                              style: const TextStyle(
                                                                                color: Color(0xff8e3434),
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Divider(
                                                                        color: Colors
                                                                            .black12,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            SqliteService
                                                                                service =
                                                                                SqliteService();
                                                                            service.deleteItem(mysavedData.data?.elementAt(indexList2).caseName.toString().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<',
                                                                                ''));
                                                                            setState(() {
                                                                              initialIndex = 1;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.05,
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.4,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: const Color(0xff8e3434),
                                                                            ),
                                                                            child:
                                                                                const Center(
                                                                              child: Text(
                                                                                'Remove',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
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
                                                      );
                                                    } else {
                                                      return Container();
                                                    }
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ),

                        if (day == 'day_3')
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            width: double.maxFinite,
                            child: Visibility(
                              visible:
                                  index <= snapshot.data!.day_3.dayHalls.length,
                              child: Column(
                                children: [
                                  // const SizedBox(height: 10),
                                  Visibility(
                                    visible: snapshot.data!.day_3.dayHalls
                                        .elementAt(index)
                                        .hallDetail
                                        .toString()
                                        .isNotEmpty,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data?.day_3
                                                            .dayHalls
                                                            .elementAt(index)
                                                            .hallDetail ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
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
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height *
                                  //         0.01),
                                  FutureBuilder<List<Sessions>>(
                                      future: service.getItems(),
                                      builder: (context, mysavedData) {
                                        List<String> sessions = [];
                                        for (var element in snapshot
                                            .data!.day_3.dayHalls
                                            .elementAt(index)
                                            .hallSessions) {
                                          sessions.add(element.sessionDetail
                                              .toString()
                                              .toLowerCase()
                                              .toString()
                                              .replaceAll('br', '')
                                              .replaceAll('br', '')
                                              .replaceAll('>', '')
                                              .replaceAll('/', '')
                                              .replaceAll('<', ''));
                                        }
                                        if (mysavedData.hasData) {
                                          return SizedBox(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                itemCount:
                                                    mysavedData.data!.length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  if (mysavedData.hasData) {
                                                    if (sessions.contains(
                                                        mysavedData.data!
                                                            .elementAt(
                                                                indexList2)
                                                            .description
                                                            .toString()
                                                            .toLowerCase()
                                                            .toString()
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll('>', '')
                                                            .replaceAll('/', '')
                                                            .replaceAll(
                                                                '<', ''))) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.43.sh,
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          5)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
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
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.5.w,
                                                                          child:
                                                                              Text(
                                                                            snapshot.data?.day_3.dayHalls.elementAt(index).hallName ??
                                                                                '',
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          mysavedData.data?.elementAt(indexList2).caseTime ??
                                                                              '',
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
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.8,
                                                                            child:
                                                                                Text(
                                                                              mysavedData.data?.elementAt(indexList2).description ?? '',
                                                                              style: const TextStyle(
                                                                                color: Color(0xff8e3434),
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Divider(
                                                                        color: Colors
                                                                            .black12,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            SqliteService
                                                                                service =
                                                                                SqliteService();
                                                                            service.deleteItem(mysavedData.data?.elementAt(indexList2).caseName.toString().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<',
                                                                                ''));
                                                                            setState(() {
                                                                              initialIndex = 2;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.05,
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.4,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: const Color(0xff8e3434),
                                                                            ),
                                                                            child:
                                                                                const Center(
                                                                              child: Text(
                                                                                'Remove',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
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
                                                      );
                                                    } else {
                                                      return Container();
                                                    }
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ),

                        if (day == 'day_4')
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            width: double.maxFinite,
                            child: Visibility(
                              visible:
                                  index <= snapshot.data!.day_4.dayHalls.length,
                              child: Column(
                                children: [
                                  // const SizedBox(height: 10),
                                  Visibility(
                                    visible: snapshot.data!.day_4.dayHalls
                                        .elementAt(index)
                                        .hallDetail
                                        .toString()
                                        .isNotEmpty,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 0.2, color: Colors.black12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SingleChildScrollView(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data?.day_4
                                                              .dayHalls
                                                              .elementAt(index)
                                                              .hallDetail ??
                                                          '',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //     height: MediaQuery.of(context).size.height *
                                  //         0.01),
                                  FutureBuilder<List<Sessions>>(
                                      future: service.getItems(),
                                      builder: (context, mysavedData) {
                                        List<String> sessions = [];
                                        for (var element in snapshot
                                            .data!.day_4.dayHalls
                                            .elementAt(index)
                                            .hallSessions) {
                                          sessions.add(element.sessionDetail
                                              .toString()
                                              .toLowerCase()
                                              .toString()
                                              .replaceAll('br', '')
                                              .replaceAll('br', '')
                                              .replaceAll('>', '')
                                              .replaceAll('/', '')
                                              .replaceAll('<', ''));
                                        }
                                        if (mysavedData.hasData) {
                                          return SizedBox(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                itemCount:
                                                    mysavedData.data!.length,
                                                itemBuilder:
                                                    (context, indexList2) {
                                                  if (mysavedData.hasData) {
                                                    if (sessions.contains(
                                                        mysavedData.data!
                                                            .elementAt(
                                                                indexList2)
                                                            .description
                                                            .toString()
                                                            .toLowerCase()
                                                            .toString()
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll(
                                                                'br', '')
                                                            .replaceAll('>', '')
                                                            .replaceAll('/', '')
                                                            .replaceAll(
                                                                '<', ''))) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.43.sh,
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          5)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
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
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.5.w,
                                                                          child:
                                                                              Text(
                                                                            snapshot.data?.day_4.dayHalls.elementAt(index).hallName ??
                                                                                '',
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          mysavedData.data?.elementAt(indexList2).caseTime ??
                                                                              '',
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
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.8,
                                                                            child:
                                                                                Text(
                                                                              mysavedData.data?.elementAt(indexList2).description ?? '',
                                                                              style: const TextStyle(
                                                                                color: Color(0xff8e3434),
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Divider(
                                                                        color: Colors
                                                                            .black12,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            SqliteService
                                                                                service =
                                                                                SqliteService();
                                                                            service.deleteItem(mysavedData.data?.elementAt(indexList2).caseName.toString().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<',
                                                                                ''));
                                                                            setState(() {
                                                                              initialIndex = 3;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.05,
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.4,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              color: const Color(0xff8e3434),
                                                                            ),
                                                                            child:
                                                                                const Center(
                                                                              child: Text(
                                                                                'Remove',
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
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
                                                      );
                                                    } else {
                                                      return Container();
                                                    }
                                                  } else {
                                                    return Container();
                                                  }
                                                }),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ),
                        // const SizedBox(height: 15),
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
                            color: Color(0xff8e3434),
                          ),
                        ),
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
