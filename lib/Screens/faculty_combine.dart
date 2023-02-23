import 'package:flutter/material.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

class CombineFaculty extends StatefulWidget {
  const CombineFaculty({Key? key}) : super(key: key);

  @override
  State<CombineFaculty> createState() => _CombineFacultyState();
}

class _CombineFacultyState extends State<CombineFaculty> {
  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  var day = '0';
  var type = '';
  List data = ['Foreign', 'Pakistan'];
  GlobalKey streamKey = GlobalKey();
  List<HallSessions>? allhallSessions = [];
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
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
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
                      'Faculty',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.05),
                ),
                child: GridView.builder(
                    itemCount: data.length,
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
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                              child: Text(
                            '${data.elementAt(indexlist)}',
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
              Visibility(
                visible: index == 0,
                child: StreamBuilder<Data?>(
                    key: streamKey,
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
                              Visibility(
                                visible: index <=
                                    snapshot.data!.day_1.dayHalls.length,
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
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          itemCount: snapshot
                                              .data?.foreignFaculty.length,
                                          itemBuilder: (context, indexList2) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.43,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey.shade400,
                                                            spreadRadius: 1,
                                                            blurRadius: 5)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              '${snapshot.data?.foreignFaculty.elementAt(indexList2).toString()}'),
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
              Visibility(
                visible: index == 1,
                child: StreamBuilder<Data?>(
                    key: streamKey,
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
                              Visibility(
                                visible: index <=
                                    snapshot.data!.day_1.dayHalls.length,
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
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          itemCount: snapshot
                                              .data?.localFaculty.length,
                                          itemBuilder: (context, indexList2) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.43,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey.shade400,
                                                            spreadRadius: 1,
                                                            blurRadius: 5)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              '${snapshot.data?.localFaculty.elementAt(indexList2).toString()}'),
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
            ],
          ),
        ),
      ),
    );
  }
}
