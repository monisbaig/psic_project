import 'package:flutter/material.dart';
import 'package:psic_project/Screens/home_sceen.dart';
import 'package:psic_project/Screens/onbording_screen.dart';
import 'package:psic_project/Screens/walkthrough_1.dart';
import 'package:psic_project/Screens/walkthrough_2.dart';
import 'package:psic_project/Screens/walkthrough_3.dart';
import 'package:psic_project/Screens/walkthrough_4.dart';
import 'package:psic_project/Screens/walkthrough_5.dart';
import 'package:psic_project/Screens/walkthrough_6.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewOnboarding extends StatefulWidget {
  const PageViewOnboarding({Key? key}) : super(key: key);

  @override
  State<PageViewOnboarding> createState() => _PageViewOnboardingState();
}

class _PageViewOnboardingState extends State<PageViewOnboarding> {
  PageController controller = PageController();
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.87,
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [
                Walkthrough5Screen(),
                Walkthrough6Screen(),
                Walkthrough1Screen(),
                Walkthrough2Screen(),
                Walkthrough3Screen(),
                Walkthrough4Screen(),
                OnBordingScreenPage()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreenPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff8e3434),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        ' Skip Introduction',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 20),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 7,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 10.0,
                          dotWidth: 15.0,
                          dotHeight: 10.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          dotColor: Color(0xff8e3434),
                          activeDotColor: Color(0xff8e3434)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Visibility(
                    visible: index == 6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, right: 20),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreenPage()));
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xff8e3434),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                  Visibility(
                    visible: index != 6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, right: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 20),
                                curve: Curves.easeIn);
                          });
                        },
                        child: const Image(
                          image: AssetImage(
                              'assets/images/onboarding_forward.png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
