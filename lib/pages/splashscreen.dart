import 'dart:async';

import 'package:evolution_fitness/drawer_pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AfterSplash extends StatefulWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Dashboard())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: 160,
              width: 300,
              child: Image.asset('assets/images/logo.jpg'),
            ).centered(),
            CircularProgressIndicator(
              color: Theme.of(context).backgroundColor,
            ).centered(),
          ],
        ),
      ),
    );
  }
}
