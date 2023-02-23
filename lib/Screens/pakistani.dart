import 'package:flutter/material.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

class Pakistani extends StatefulWidget {
  const Pakistani({Key? key}) : super(key: key);

  @override
  State<Pakistani> createState() => _PakistaniState();
}

class _PakistaniState extends State<Pakistani> {
  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  var day = '0';
  var type = '';
  GlobalKey streamKey = GlobalKey();
  List<HallSessions>? allHallSessions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                              const Padding(
                                padding: EdgeInsets.only(right: 90),
                                child: Text(
                                  'Faculty (Pakistan)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.88,
                                child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    itemCount:
                                        snapshot.data?.localFaculty.length,
                                    itemBuilder: (context, indexList2) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.43,
                                              margin: const EdgeInsets.all(10),
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
      ),
    );
  }
}
