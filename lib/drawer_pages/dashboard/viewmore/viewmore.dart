// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/shimmer_widget.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 70,
                    color: Colors.grey[50],
                    child: "Consumed\nCalories"
                        .text
                        .align(TextAlign.center)
                        .xl
                        .makeCentered(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 70,
                    color: Colors.grey[50],
                    child: "Remaining\nCalories"
                        .text
                        .align(TextAlign.center)
                        .xl
                        .makeCentered(),
                  ),
                ),
              ],
            ),
          ).wFull(context).hOneThird(context).cornerRadius(5).p16(),
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildViewMoreShimmer();
                }).pSymmetric(h: 16),
          ),
        ],
      ),
    );
  }

  Widget buildViewMoreShimmer() {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 6,
            width: screenWidth * 80,
          ).cornerRadius(5),
          const ShimmerWidget.rectangular(
            height: 6,
          ).cornerRadius(5),
          ShimmerWidget.rectangular(
            height: 6,
            width: screenWidth * 50,
          ).cornerRadius(5)
        ],
      ).p4(),
    ).pOnly(bottom: 4);
  }
}
