// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;
import 'package:intl/intl.dart';
import 'package:psic_project/Model/data_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controller/program_controller.dart';
import '../widgets/custom_navigation_bar.dart';

class SessionDetail extends StatefulWidget {
  SessionDetail(
      {Key? key,
      this.sessions,
      this.hallIndex,
      this.sessionIndex,
      this.allSessionsList,
      this.comingFrom,
      this.program})
      : super(key: key);
  HallSessions? sessions;
  var hallIndex;
  var sessionIndex;
  var comingFrom;
  List<HallSessions>? allSessionsList;
  var program;
  @override
  State<SessionDetail> createState() => _SessionDetailState();
}

class _SessionDetailState extends State<SessionDetail> {
  var Length1 = 0.0;
  var Length2 = 0.0;
  var Length3 = 0.0;
  var Length4 = 0.0;
  static FlutterLocalNotificationsPlugin fltrNotification =
      FlutterLocalNotificationsPlugin();
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    var androidInitialize = const AndroidInitializationSettings('app_logo');

    var iosInitialize = const DarwinInitializationSettings();
    var initializeSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    fltrNotification.initialize(
      initializeSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    // for (var element in widget.sessions!.sessionTimeSlots) {
    //   Length3 = Length3 + 600;
    // }
    // for (var element in widget.sessions!.sessionChairpersons) {
    //   Length2 = Length2 + 130;
    // }
    // for (var element in widget.sessions!.sessionModerators) {
    //   Length1 = Length1 + 130;
    // }
  }

  Future<List<String>> htmlParseModerator() {
    var document = parse(widget.sessions!.sessionModerators!
        .map((e) => e.sessionModerator!.userAvatar)
        .toString());
    var imgList = document.querySelectorAll('img');
    List<String> imageList = [];
    for (dom.Element img in imgList) {
      imageList.add(img.attributes['src']!);
    }
    return Future.value(imageList);
  }

  Future<List<String>> htmlParseFacilitator() {
    var document = parse(widget.sessions!.sessionFacilitators!
        .map((e) => e.sessionFacilitator!.userAvatar)
        .toString());
    var imgList = document.querySelectorAll('img');
    List<String> imageList = [];
    for (dom.Element img in imgList) {
      print(img.attributes['src'].toString());
      imageList.add(img.attributes['src']!);
    }
    return Future.value(imageList);
  }

  Future<List<String>> htmlParseChairperson() {
    var document = parse(widget.sessions!.sessionChairpersons!
        .map((e) => e.sessionChairperson!.userAvatar)
        .toString());
    var imgList = document.querySelectorAll('img');
    List<String> imageList = [];
    for (dom.Element img in imgList) {
      imageList.add(img.attributes['src']!);
    }
    return Future.value(imageList);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future showNotification({title, description, time, date}) async {
    var androidDetails = const AndroidNotificationDetails("Channel ID", "Psic",
        channelDescription: "This is my channel",
        importance: Importance.max,
        playSound: true);
    var iosDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    Random num = Random();
    //await fltrNotification.show(num.nextInt(1000), "$title", "$description",generalNotificationDetails);
    DateFormat dateFormat = DateFormat("dd/MM/yyyy HH");
    var dateTime = dateFormat.parse(
        "${date.toString().split('/').elementAt(0)}/8/${date.toString().split('/').elementAt(2)}"
        " ${time.split(':').elementAt(0)}");
    // print(dateTime);
    // var scheduleTime=DateTime.now().add(Duration(seconds: 10));
    fltrNotification.schedule(num.nextInt(1000), "$title", "$description",
        dateTime, generalNotificationDetails);
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          controller: _scrollController,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Text(
                        '${widget.sessions?.sessionName.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1,
                      blurRadius: 5)
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        size: 25,
                        color: Color(0xff8e3434),
                      ),
                      Text(
                        ' ${widget.sessions?.sessionTime}',
                        style: const TextStyle(
                          color: Color(0xff8e3434),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.info,
                        size: 25,
                        color: Color(0xff8e3434),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          ' ${widget.sessions?.sessionDetail.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}' ?? 'Empty Data',
                          style: const TextStyle(
                            color: Color(0xff8e3434),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget.sessions?.sessionModerators != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            Visibility(
              // visible: Length1 != 0,
              child: Container(
                color: Colors.grey.shade400,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: const [
                    Text(
                      'MODERATOR(S):',
                      style: TextStyle(
                        color: Color(0xff8e3434),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.sessions?.sessionModerators != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            if (widget.sessions!.sessionModerators == false)
              const SizedBox(child: Text('Empty Data')),
              SizedBox(
                height:
                    (widget.sessions?.sessionModerators!.length ?? 0) * 80.0,
                child: FutureBuilder(
                    future: htmlParseModerator(),
                    builder: (context, AsyncSnapshot<List<String>> snapshot) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.sessions?.sessionModerators!.length,
                        primary: false,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index != 0
                                  ? Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width,
                                      color: const Color(0xff8e3434),
                                    )
                                  : Container(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data![index] ?? 'https://secure.gravatar.com/avatar/a4294cf03204b4ce65046cfdc39b46b4?s=96&d=mm&r=g',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          child: Text(
                                            '${widget.sessions?.sessionModerators!.elementAt(index).sessionModerator!.userFirstname}${' '}${widget.sessions?.sessionModerators!.elementAt(index).sessionModerator!.userLastname}' ?? 'Empty Data',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),
            const SizedBox(height: 10),
            Visibility(
              visible: widget.sessions?.sessionFacilitators != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            Visibility(
              // visible: Length2 != 0,
              child: Container(
                color: Colors.grey.shade400,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: const [
                    Text(
                      'FACILITATORS(S):',
                      style: TextStyle(
                        color: Color(0xff8e3434),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.sessions?.sessionFacilitators != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            if (widget.sessions!.sessionFacilitators == false)
              const SizedBox(child: Text('Empty Data')),
              SizedBox(
                height: widget.sessions!.sessionFacilitators!.length == 5
                    ? (widget.sessions!.sessionFacilitators!.length) * 80.0
                    : (widget.sessions!.sessionFacilitators!.length) * 57.0,
                child: FutureBuilder(
                    future: htmlParseFacilitator(),
                    builder: (context, AsyncSnapshot<List<String>> snapshot) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.sessions!.sessionFacilitators!.length,
                        primary: false,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index != 0
                                  ? Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width,
                                      color: const Color(0xff8e3434),
                                    )
                                  : Container(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data![index] ?? 'https://secure.gravatar.com/avatar/a4294cf03204b4ce65046cfdc39b46b4?s=96&d=mm&r=g',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          child: Text(
                                            '${widget.sessions!.sessionFacilitators!.elementAt(index).sessionFacilitator!.userFirstname}${' '}${widget.sessions!.sessionFacilitators!.elementAt(index).sessionFacilitator!.userLastname}' ??
                                                'Empty Data',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),
            const SizedBox(height: 10),
            Visibility(
              visible: widget.sessions?.sessionChairpersons != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            Visibility(
              // visible: Length3 != 0,
              child: Container(
                color: Colors.grey.shade400,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: const [
                    Text(
                      'CHAIR PERSONS(S):',
                      style: TextStyle(
                        color: Color(0xff8e3434),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.sessions?.sessionChairpersons != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            if (widget.sessions!.sessionChairpersons == false)
              const SizedBox(child: Text('Empty Data')),
              SizedBox(
                height:
                    (widget.sessions?.sessionChairpersons!.length ?? 0) * 80.0,
                child: FutureBuilder(
                    future: htmlParseChairperson(),
                    builder: (context, AsyncSnapshot<List<String>> snapshot) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.sessions?.sessionChairpersons!.length,
                        primary: false,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index != 0
                                  ? Container(
                                      height: 2,
                                      width: MediaQuery.of(context).size.width,
                                      color: const Color(0xff8e3434),
                                    )
                                  : Container(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data![index] ?? 'https://secure.gravatar.com/avatar/a4294cf03204b4ce65046cfdc39b46b4?s=96&d=mm&r=g',
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.55,
                                          child: Text(
                                            '${widget.sessions?.sessionChairpersons!.elementAt(index).sessionChairperson!.userFirstname}${' '}${widget.sessions?.sessionChairpersons!.elementAt(index).sessionChairperson!.userLastname}' ??
                                                'Empty Data',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),
            const SizedBox(height: 10),
            Visibility(
              visible: widget.sessions?.sessionTimeSlots != false,
              child: Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff8e3434),
              ),
            ),
            Visibility(
                // visible: Length4 != 0,
                child: Container(
                  color: Colors.grey.shade400,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    children: const [
                      Text(
                        'TALKS/EVENTS:',
                        style: TextStyle(
                          color: Color(0xff8e3434),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff8e3434),
            ),
            // if (widget.sessions!.sessionTimeSlots == false &&
            //     widget.sessions!.sessionTimeSlots!.map((e) => e.facilitatorsSpeakers)== false &&
            //     widget.sessions!.sessionTimeSlots == null)
            Text(widget.sessions!.sessionTimeSlots.toString()),
            const SizedBox(child: Text('Empty Data')),
            SizedBox(
                height: widget.comingFrom != null
                    ? (widget.comingFrom.contains("Fellow’s course")
                        ? ((widget.sessions?.sessionTimeSlots!.length ??
                                    0) *
                                370) +
                            120
                        : ((widget
                                        .sessions?.sessionTimeSlots!.length ??
                                    0) *
                                200) +
                            120)
                    : (widget.sessions!.sessionName
                                .toString()
                                .toLowerCase()
                                .trim() ==
                            "Fellow’s course"
                        ? ((widget.sessions?.sessionTimeSlots!.length ?? 0) *
                                370) +
                            120
                        : ((widget.sessions?.sessionTimeSlots!.length ?? 0) *
                                200) +
                            120),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  itemCount: widget.sessions?.sessionTimeSlots!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xff8e3434),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '${widget.sessions?.sessionTimeSlots!.elementAt(index).time}' ??
                                    DateTime.now().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ProgramController controller =
                                    ProgramController();
                                controller.initializeDB();
                                Random random = Random();
                                Sessions session = Sessions(
                                  title:
                                      widget.sessions!.sessionName!.toLowerCase().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '') ?? 'Empty Data',
                                  id: random.nextInt(100),
                                  description:
                                      widget.sessions!.sessionDetail!.toLowerCase().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '') ??  'Empty Data',
                                  caseName:
                                      widget.sessions!.sessionTimeSlots!.elementAt(index).title.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '') ??
                                          'Empty Data',
                                  caseTime:
                                      '${widget.sessions!.sessionTimeSlots!.elementAt(index).time}' ??
                                          DateTime.now().toString(),
                                );
                                controller.createItem(session);
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    maxLines: 20,
                                    borderRadius: BorderRadius.circular(20),
                                    backgroundColor: const Color(0xff8e3434),
                                    textStyle:
                                        const TextStyle(color: Colors.white),
                                    message: "Added to your program",
                                  ),
                                );
                                showNotification(
                                    title:
                                        '${widget.sessions?.sessionName!.toLowerCase().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}' ?? 'Empty Data',
                                    description:
                                        '${widget.sessions?.sessionTimeSlots!.elementAt(index).title.toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}' ??
                                            'Empty Data',
                                    time: widget.sessions!.sessionTimeSlots!.elementAt(index).time ?? DateTime.now().toString(),
                                    date: widget.sessions!.sessionDate ?? DateTime.now().toString());
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Color(0xff8e3434),
                                  ),
                                  Text(
                                    'Add to my program',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff8e3434)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                '${widget.sessions?.sessionTimeSlots!.elementAt(index).title.toString().toString().replaceAll('br', '').replaceAll('br', '').replaceAll('>', '').replaceAll('/', '').replaceAll('<', '')}' ?? 'Empty Data',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                widget.sessions!.sessionTimeSlots!
                                            .elementAt(index)
                                            .facilitatorsSpeakers ==
                                        null
                                    ? 'Empty Data'
                                    : widget.sessions!.sessionTimeSlots!
                                        .elementAt(index)
                                        .facilitatorsSpeakers!
                                        .map((e) =>
                                            e.facilitatorSpeaker!.displayName)
                                        .toString()
                                        .toString()
                                        .replaceAll('br', '')
                                        .replaceAll('br', '')
                                        .replaceAll('>', '')
                                        .replaceAll('/', '')
                                        .replaceAll('<', '')
                                        .replaceAll('(', '')
                                        .replaceAll(')', ''),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: widget.sessions?.sessionTimeSlots!.length ==
                                  index + 1 &&
                              widget.program != true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.sessionIndex > 0) {
                                      widget.sessionIndex =
                                          widget.sessionIndex - 1;
                                      widget.sessions = widget.allSessionsList
                                          ?.elementAt(widget.sessionIndex);
                                      _scrollToTop();
                                    }
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: widget.sessionIndex != 0
                                        ? const Color(0xff8e3434)
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    'Previous',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (widget.sessionIndex <
                                        widget.allSessionsList?.length) {
                                      widget.sessionIndex =
                                          widget.sessionIndex + 1;
                                      widget.sessions = widget.allSessionsList
                                          ?.elementAt(widget.sessionIndex);
                                      _scrollToTop();
                                    }
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: widget.sessionIndex + 1 <
                                            widget.allSessionsList?.length
                                        ? const Color(0xff8e3434)
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 10),
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xff8e3434),
                        ),
                        // const SizedBox(height: 5),
                      ],
                    );
                  },
                ),
              ),
            // const SizedBox(height: 50),
          ],
        ),
      ),
    );

  }
  void data() {

  }
}
// "training village"