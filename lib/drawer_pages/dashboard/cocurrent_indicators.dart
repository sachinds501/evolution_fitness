// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CocurrentCPI extends StatefulWidget {
  const CocurrentCPI({Key? key}) : super(key: key);

  @override
  State<CocurrentCPI> createState() => _CocurrentCPIState();
}

class _CocurrentCPIState extends State<CocurrentCPI> {
  double rvalue = 0;
  double bvalue = 0;
  double gvalue = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      rvalue = 0;
      bvalue = 0;
      gvalue = 0;
    });
    downloadData();
  }

  @override
  Widget build(BuildContext context) {
    final bgcolor = Theme.of(context).canvasColor;
    // double value = widget.value;

    return Stack(alignment: Alignment.center, children: [
      Positioned(
        // top: 33,
        // left: 33,
        child: VxCircle(
          radius: 190,
          backgroundColor: Colors.transparent,
          child: CircularProgressIndicator(
              backgroundColor: bgcolor,
              strokeWidth: 10,
              color: Colors.redAccent,
              value: 0.25),
        ),
      ),
      Positioned(
        // top: 17,
        // left: 17,
        child: VxCircle(
          radius: 222,
          backgroundColor: Colors.transparent,
          child: CircularProgressIndicator(
              backgroundColor: bgcolor,
              strokeWidth: 10,
              color: Colors.blueGrey,
              value: 0.3),
        ),
      ),
      Positioned(
        // top: 48,
        // left: 50,
        child: CircleAvatar(
          radius: 73,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/logo.jpg'),
        ),
      ),
      Positioned(
        // top: 5,
        // left: 20,
        child: VxCircle(
          radius: 255,
          backgroundColor: Colors.transparent,
          child: CircularProgressIndicator(
              backgroundColor: bgcolor,
              strokeWidth: 10,
              color: Colors.lightBlueAccent,
              value: bvalue),
        ),
      ),
    ]);
  }

  void downloadData() {
    Timer.periodic(const Duration(microseconds: 1000), (Timer timer) {
      setState(() {
        if (bvalue == 1) {
          timer.cancel();
          bvalue = 0;
        } else {
          bvalue = bvalue + 0.001;
        }
        if (gvalue == 0.1) {
          timer.cancel();
          gvalue = 0;
        } else {
          gvalue = gvalue + 0.001;
        }
        if (rvalue == 0.8) {
          timer.cancel();
          rvalue = 0;
        } else {
          rvalue = rvalue + 0.001;
        }
      });
    });
  }
}
