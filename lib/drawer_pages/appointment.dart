// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: "Appointment".text.xl.black.bold.make(),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VxTwoRow(
                  left: const Icon(
                    Icons.circle_rounded,
                    size: 10,
                    color: Colors.red,
                  ),
                  right: "Current Date".text.make(),
                ),
                VxTwoRow(
                    left: const Icon(
                      Icons.circle_rounded,
                      size: 10,
                      color: Colors.blue,
                    ),
                    right: "Appointment Date".text.make())
              ],
            ),
          ).p12(),
          buildAppointmentShimmer().pOnly(),
        ],
      ),
    );
  }

  Widget buildAppointmentShimmer() {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return SizedBox(
      // color: Colors.white,
      height: screenHeight * 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: screenHeight * 30,
              color: Colors.white,
              child: ShimmerWidget.rectangular(height: screenHeight * 25).p8()),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: screenHeight * 8,
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 5,
                    width: screenWidth * 80,
                  ).cornerRadius(15),
                  const ShimmerWidget.rectangular(
                    height: 5,
                  ).cornerRadius(15),
                  ShimmerWidget.rectangular(
                    height: 5,
                    width: screenWidth * 50,
                  ).cornerRadius(15),
                ]).p4(),
          ),
        ],
      ),
    ).pOnly(bottom: 4);
  }
}

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      period: const Duration(seconds: 1),
      child: Container(
        decoration: ShapeDecoration(color: Colors.grey, shape: shapeBorder),
        width: width,
        height: height,
      ),
    );
  }
}
