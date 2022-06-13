// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CocurrentCPI extends StatefulWidget {
  CocurrentCPI({Key? key, required this.value}) : super(key: key);
  double value;

  @override
  State<CocurrentCPI> createState() => _CocurrentCPIState();
}

class _CocurrentCPIState extends State<CocurrentCPI> {
  @override
  Widget build(BuildContext context) {
    final bgcolor = Theme.of(context).backgroundColor;
    // double value = widget.value;

    if (widget.value == 0) {
      downloadData();
      setState(() {});
    }

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
                value: widget.value),
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
    Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      setState(() {
        if (widget.value == 1) {
          timer.cancel();
          widget.value = 0;
        } else {
          widget.value = widget.value + 0.001;
        }
      });
    });
  }
}
