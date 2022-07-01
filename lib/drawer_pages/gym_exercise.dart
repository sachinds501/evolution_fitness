// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/shimmer_widget.dart';

class GymExercise extends StatefulWidget {
  const GymExercise({Key? key}) : super(key: key);

  @override
  State<GymExercise> createState() => _GymExerciseState();
}

class _GymExerciseState extends State<GymExercise> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: myAppBar(context, 'Gym Exercise'),
      body: Column(
        children: [
          Container(
                  color: Colors.white,
                  child: Center(child: const PickDate().p16()))
              .cornerRadius(8)
              .h(80)
              .p16(),
          SizedBox(
            height: 250,
            child: _isLoading
                ? ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return buildGymShimmer();
                    },
                  )
                : null,
          ).pSymmetric(h: 16)
        ],
      ),
    );
  }

  Widget buildGymShimmer() {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 5,
            width: screenWidth * 80,
          ).cornerRadius(5),
          const ShimmerWidget.rectangular(
            height: 5,
          ).wFull(context).cornerRadius(5),
          const ShimmerWidget.rectangular(
            height: 5,
          ).w48(context).cornerRadius(5),
        ],
      ).p4(),
    ).pOnly(bottom: 4);
  }
}
