import 'package:flutter/material.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:psic_project/Screens/session_by_type_detail.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';

import '../widgets/custom_navigation_bar.dart';

class SessionByTypeScreenPage extends StatefulWidget {
  const SessionByTypeScreenPage({Key? key}) : super(key: key);

  @override
  State<SessionByTypeScreenPage> createState() =>
      _SessionByTypeScreenPageState();
}

class _SessionByTypeScreenPageState extends State<SessionByTypeScreenPage> {
  int index = 0;
  final SessionByDayController _sessionByDayController =
      SessionByDayController();
  var day = '';
  var type = '';
  GlobalKey streamKey = GlobalKey();
  List<HallSessions>? allHallSessions = [];

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
          child: StreamBuilder<Data?>(
              key: streamKey,
              stream: _sessionByDayController.getData(day).asStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
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
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Sessions by Type',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.79,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.05),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      itemCount:
                                          snapshot.data!.sessionTypes.length,
                                      itemBuilder: (context, indexList) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              type = snapshot.data!.sessionTypes
                                                  .elementAt(indexList);
                                              index = indexList;
                                            });
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SessionByTypeDetail(
                                                          day: day,
                                                          type: type,
                                                        )));
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: index == indexList
                                                  ? const Color(0xff8e3434)
                                                  : Colors.white,
                                              borderRadius: indexList == 0
                                                  ? const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10))
                                                  : indexList + 1 ==
                                                          snapshot
                                                              .data
                                                              ?.sessionTypes
                                                              .length
                                                      ? const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))
                                                      : BorderRadius.circular(
                                                          0),
                                            ),
                                            child: Center(
                                                child: Text(
                                              '${snapshot.data?.sessionTypes.elementAt(indexList).toString()}',
                                              style: TextStyle(
                                                color: index != indexList
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            )),
                                          ),
                                        );
                                      })),
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
