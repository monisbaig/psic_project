import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:psic_project/Screens/home_sceen.dart';
import 'package:psic_project/controller/program_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controller/session_by_day_controller.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  String debugLabelString = "";

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  // final bool _requireConsent = false;
  ProgramController controller = ProgramController();
  SessionByDayController sessionByDayController = SessionByDayController();

  @override
  void initState() {
    getData();
    controller.initializeDB();
    super.initState();
    initPlatformState();
    loadTimer();
  }

  void loadTimer() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreenPage(),
        ),
        (route) => false,
      );
    });
  }

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
      setState(() {
        debugLabelString =
            "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
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
      setState(() {
        debugLabelString =
            "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180.h,
              width: 180.w,
              child: Image.asset('assets/images/log.jpg'),
            ),
            Column(
              children: const [
                Text(
                  'Pakistan Society of ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Interventional Cardiology',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 90.h),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: SizedBox(
            //     width: 350.w,
            //     child: const Image(
            //       image: AssetImage('assets/images/cover.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: MediaQuery.of(context).size.height * 0.3),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => const HomeScreenPage(),
            //         ),
            //       );
            //     },
            //     child: Container(
            //       height: MediaQuery.of(context).size.height * 0.08,
            //       width: MediaQuery.of(context).size.width * 0.9,
            //       decoration: BoxDecoration(
            //         color: const Color(0xff8e3434),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           'GET STARTED',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.w700,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// "",
