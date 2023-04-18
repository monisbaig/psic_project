import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/custom_navigation_bar.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
  }

  String html =
      '<iframe width="560" height="315" src="https://www.youtube.com/embed/xVM41cld7dM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(html));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 34),
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
                    'Watch Live',
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.62.h,
              width: double.infinity,
              child: Stack(
                children: [
                  WebView(
                    initialUrl: 'data:text/html;base64,$contentBase64',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onPageStarted: (String url) {
                      print('Page started loading: $url');
                    },
                    onPageFinished: (String url) {
                      print('Page finished loading: $url');
                    },
                    gestureNavigationEnabled: true,
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff8e3434),
                          ),
                        )
                      : Stack(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
