import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/all_widgets.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Term and Conditions'),
      body: WebView(
        initialUrl: 'https://simplyloose.com/rules-regulation',
        zoomEnabled: true,
        onPageFinished: (value) {},
        onPageStarted: (val) =>
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(val),
          duration: const Duration(seconds: 2),
        )),
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  double value = 0;

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    super.initState();

    // setState(() {
    //   value = 0;
    // });
    // downloadData();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'About Us'),
      body: WebView(
        initialUrl: 'https://simplyloose.com/aboutus',
        zoomEnabled: true,
        // onProgress: (val) => {
        //   if (val != 100)
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text('Loading $val %'),
        //       // duration: const Duration(seconds: 2),
        //     ))
        // },
        onPageStarted: (val) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(val),
            duration: const Duration(seconds: 2),
          ))
        },
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }

  // void downloadData() {
  //   Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
  //     setState(() {
  //       if (value == 1) {
  //         timer.cancel();
  //         value = 0;
  //       } else {
  //         value = value + 0.01;
  //       }
  //     });
  //   });
  // }
}
