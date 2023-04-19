// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:psic_project/Screens/case_corner_screen.dart';
import 'package:psic_project/Screens/fellow_courses_screen.dart';
import 'package:psic_project/Screens/live_screen.dart';
import 'package:psic_project/Screens/live_screen_1.dart';
import 'package:psic_project/Screens/live_screen_2.dart';
import 'package:psic_project/Screens/live_usama.dart';
import 'package:psic_project/Screens/pak_live_hall_.dart';
import 'package:psic_project/Screens/pak_live_hall_B.dart';
import 'package:psic_project/Screens/pak_live_hall_C.dart';
import 'package:psic_project/Screens/program_screen.dart';
import 'package:psic_project/Screens/session_by_day_screen.dart';
import 'package:psic_project/Screens/session_by_type_screen.dart';
import 'package:psic_project/Screens/sidebar_screen.dart';
import 'package:psic_project/Screens/whats_happening_screen.dart';
import 'package:psic_project/Screens/work_shop_screen.dart';
import 'package:psic_project/controller/session_by_day_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controller/program_controller.dart';
import '../widgets/custom_navigation_bar.dart';
import 'learning_courses.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  ProgramController controller = ProgramController();
  SessionByDayController sessionByDayController = SessionByDayController();

  getData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      SharedPreferences.getInstance().then((value) => {
            jsondata = value.getString('data'),
            if (jsondata == null)
              {
                showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                    maxLines: 20,
                    borderRadius: BorderRadius.circular(20),
                    backgroundColor: const Color(0xff8e3434),
                    textStyle: const TextStyle(color: Colors.white),
                    message: "No Internet Access",
                  ),
                )
              }
          });
    } else {
      sessionByDayController.getDataSplash();
    }
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    // OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);
    OneSignal.shared.setAppId("dffe675c-baa4-4899-a34c-ad22111c1eb2");
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const HomeScreenPage(),
        ),
      );
      print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      setState(() {});
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: $event');

      /// Display Notification, send null to not display
      event.complete(event.notification);
      Random random = Random();
      controller.createNotif(CustomNotifications(
          title: event.notification.title,
          description: event.notification.body,
          id: random.nextInt(1000),
          time: '${DateTime.now().hour}:${DateTime.now().minute}'));
      setState(() {});
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print("SetNotificationOpenedHandler ${result.notification}");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const HomeScreenPage(),
        ),
      );
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() async {
    await getData();
    await SessionByDayController().getDataSplash();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    controller.initializeDB();
    initPlatformState();
    OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
    OneSignal.shared.setAppId('dffe675c-baa4-4899-a34c-ad22111c1eb2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      bottomNavigationBar: const CustomNavigationBar(
        onHomeResponse: true,
      ),
      drawer: const SidebarScreenPage(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(left: 8, right: 30),
                            child: Icon(
                              Icons.menu_outlined,
                              size: 30,
                              color: Color(0xff8e3434),
                            )),
                      ),
                      const Text(
                        'Home',
                        style: TextStyle(
                          color: Color(0xff8e3434),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              var connectivityResult =
                                  await (Connectivity().checkConnectivity());
                              if (connectivityResult !=
                                  ConnectivityResult.none) {
                                SessionByDayController().getDataSplash();
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    maxLines: 20,
                                    borderRadius: BorderRadius.circular(20),
                                    backgroundColor: Colors.green,
                                    textStyle:
                                        const TextStyle(color: Colors.white),
                                    message: "Data Fetched Successfully!",
                                  ),
                                );
                              } else {
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.success(
                                    maxLines: 20,
                                    borderRadius: BorderRadius.circular(20),
                                    backgroundColor: const Color(0xff8e3434),
                                    textStyle:
                                        const TextStyle(color: Colors.white),
                                    message: "No Internet Access",
                                  ),
                                );
                              }
                            },
                            child: const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.restore,
                                  size: 25,
                                  color: Color(0xff8e3434),
                                )),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreenPage(),
                                ),
                              );
                            },
                            child: const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.notifications_active,
                                  size: 25,
                                  color: Color(0xff8e3434),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.h),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.19.h,
                    width: 325.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cover.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                // ConstrainedBox(
                //   constraints: BoxConstraints.expand(
                //     height: 320.h,
                //   ),
                // height: MediaQuery.of(context).size.aspectRatio * 665.h,
                // width: MediaQuery.of(context).size.width,
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  padding: EdgeInsets.only(bottom: 10.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2,
                  children: List.generate(
                    8,
                    (index) {
                      return Container(
                        child: getMainMenus(index),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        return await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('All Live Sessions:'),
                              actions: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PakLiveHallA(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff8e3434),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    // padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'PAK Live 2023 HAll A',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PakLiveHallB(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff8e3434),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    // padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'PAK Live 2023 HAll B',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PakLiveHallC(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff8e3434),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    // padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'PAK Live 2023 HAll C',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0xff8e3434),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ],
                        ),
                        // padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/SVG/courses icon .svg',
                                // width: 10.w,
                                height: 22.h,
                                // MediaQuery.of(context).size.height * 0.04.h,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6.w),
                              const Text(
                                'Watch Live',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getMainMenus(int index) {
    switch (index) {
      case 0:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SessionByDayScreenPage()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/sessions by day icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'Conference Program',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 1:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProgramScreenPage()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, right: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/my program icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'My Program',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 2:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SessionByTypeScreenPage(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/sessions by type icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'Sessions by Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 3:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WhatsHappeningScreenPage()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, right: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1,
                      blurRadius: 5)
                ]),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/whats happening icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'What\'s Happening',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 4:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CaseCornerScreenPage()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/case corner icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'Fellows Case Corners',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 5:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LearningPage(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, right: 10.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1,
                      blurRadius: 5)
                ]),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/fellow course icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'Learning Sessions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 6:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FellowCoursesScreenPage()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 5)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/SVG/learning session icon.svg',
                    width: 25.w,
                    color: const Color(0xff8e3434),
                  ),
                  Text(
                    'Fellows Course',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      case 7:
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WorkShopScreenPage()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, right: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 5),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    MdiIcons.fitToScreen,
                    color: const Color(0xff8e3434),
                    size: 28.sp,
                  ),
                  Text(
                    'Training Villages',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xff8e3434),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      default:
        return Container();
    }
  }
}

class NotificationScreenPage extends StatefulWidget {
  const NotificationScreenPage({Key? key}) : super(key: key);

  @override
  State<NotificationScreenPage> createState() => _NotificationScreenPageState();
}

class _NotificationScreenPageState extends State<NotificationScreenPage> {
  SqliteService sqliteService = SqliteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black54,
                          size: 30,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Notifications',
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
              const SizedBox(height: 20),
              FutureBuilder<List<CustomNotifications>>(
                future: sqliteService.getNotif(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print('okkkk${snapshot.data!.first.time}');
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xff8e3434),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 0.2, color: Colors.black12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 14, left: 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: Text(
                                              '${snapshot.data!.elementAt(index).title}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Text(
                                            '${snapshot.data!.elementAt(index).description}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 8),
                                    child: Text(
                                      '${snapshot.data!.elementAt(index).time}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
