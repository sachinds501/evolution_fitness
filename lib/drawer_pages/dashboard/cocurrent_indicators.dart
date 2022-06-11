import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Center cocurrentCircularProgressIndicators(Color bgcolor) {
  return Center(
    child: Stack(
      children: [
        Positioned(
          top: 48,
          left: 50,
          child: CircleAvatar(
            radius: 73,
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/logo.jpg'),
          ),
        ),
        Positioned(
          top: 33,
          left: 33,
          child: VxCircle(
            radius: 190,
            backgroundColor: Colors.transparent,
            child: CircularProgressIndicator(
                strokeWidth: 10, color: bgcolor, value: 1),
          ),
        ),
        VxCircle(
          radius: 255,
          backgroundColor: Colors.transparent,
          child: const CircularProgressIndicator(
              strokeWidth: 10, color: Colors.lightBlueAccent, value: 1),
        ),
        Positioned(
          top: 17,
          left: 17,
          child: VxCircle(
            radius: 222,
            backgroundColor: Colors.transparent,
            child: CircularProgressIndicator(
                strokeWidth: 10, color: bgcolor, value: 1),
          ),
        ),
      ],
    ),
  );
}
