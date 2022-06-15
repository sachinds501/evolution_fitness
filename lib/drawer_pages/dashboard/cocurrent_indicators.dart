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
  double value = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      value = 0;
    });
    downloadData();
  }

  @override
  Widget build(BuildContext context) {
    final bgcolor = Theme.of(context).canvasColor;
    // double value = widget.value;

    return Center(
      child: Stack(
        children: [
          VxCircle(
            radius: 255,
            backgroundColor: Colors.transparent,
            child: CircularProgressIndicator(
                backgroundColor: bgcolor,
                strokeWidth: 10,
                color: Colors.lightBlue,
                value: value),
          ),
          Positioned(
            top: 33,
            left: 33,
            child: VxCircle(
              radius: 190,
              backgroundColor: Colors.transparent,
              child: CircularProgressIndicator(
                  backgroundColor: bgcolor,
                  strokeWidth: 10,
                  color: Colors.purple,
                  value: 0.01),
            ),
          ),
          Positioned(
            top: 17,
            left: 17,
            child: VxCircle(
              radius: 222,
              backgroundColor: Colors.transparent,
              child: CircularProgressIndicator(
                  backgroundColor: bgcolor,
                  strokeWidth: 10,
                  color: Colors.red,
                  value: 0.01),
            ),
          ),
          Positioned(
            top: 48,
            left: 50,
            child: CircleAvatar(
              radius: 73,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/logo.jpg'),
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.all(20),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         onPrimary: Colors.white, primary: Colors.green),
          //     onPressed: () {
          //       value = 0;
          //       downloadData(value);
          //       setState(() {});
          //     },
          //     child: const Text("Download File"),
          //   ),
          // )
        ],
      ),
    );
  }

  void downloadData() {
    Timer.periodic(const Duration(microseconds: 1000), (Timer timer) {
      setState(() {
        if (value == 1) {
          timer.cancel();
          value = 0;
        } else {
          value = value + 0.001;
        }
      });
    });
  }
}
