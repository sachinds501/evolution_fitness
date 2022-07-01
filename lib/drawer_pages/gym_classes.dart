// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/all_widgets.dart';
import '../widgets/shimmer_widget.dart';

class GymClasses extends StatefulWidget {
  const GymClasses({Key? key}) : super(key: key);

  @override
  State<GymClasses> createState() => _GymClassesState();
}

class _GymClassesState extends State<GymClasses> {
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
      appBar: myAppBar(context, 'Gym Classes'),
      body: Column(
        children: [
          Container(
                  color: Colors.white,
                  child: Center(child: const PickDate().p16()))
              .cornerRadius(8)
              .h(80)
              .p16(),
          SizedBox(
                  height: 400,
                  child: _isLoading
                      ? ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return buildClassesShimmer();
                          },
                        )
                      : null)
              .pSymmetric(h: 16),
        ],
      ),
    );
  }

  Widget buildClassesShimmer() {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const ShimmerWidget.circular(
                height: 55,
                width: 55,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(
                        height: 10,
                        width: screenWidth * 60,
                      ).cornerRadius(5),
                      ShimmerWidget.rectangular(
                        height: 8,
                        width: screenWidth * 55,
                      ).cornerRadius(5),
                    ],
                  ).pSymmetric(h: 16),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 8,
                    width: screenWidth * 70,
                  ).cornerRadius(5),
                  const ShimmerWidget.rectangular(
                    height: 8,
                  ).cornerRadius(5),
                  ShimmerWidget.rectangular(
                    height: 8,
                    width: screenWidth * 80,
                  ).cornerRadius(5),
                ],
              ))
        ],
      ).p12(),
    ).pOnly(bottom: 4).cornerRadius(5);
  }
}
