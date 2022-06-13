// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/shimmer_widget.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: "Videos".text.xl.black.bold.make(),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return buildVideoShimmer();
          }).pOnly(top: 16, left: 16, right: 16),
    );
  }

  Widget buildVideoShimmer() {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return SizedBox(
      // color: Colors.white,
      height: screenHeight * 36,
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
            height: screenHeight * 5,
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 2,
                    width: screenWidth * 80,
                  ).cornerRadius(5),
                  const ShimmerWidget.rectangular(
                    height: 2,
                  ).cornerRadius(5),
                  ShimmerWidget.rectangular(
                    height: 2,
                    width: screenWidth * 50,
                  ).cornerRadius(5)
                ]).p4(),
          ),
        ],
      ),
    ).pOnly(bottom: 4);
  }
}


