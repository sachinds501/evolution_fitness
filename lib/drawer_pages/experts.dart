// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/shimmer_widget.dart';

class Experts extends StatefulWidget {
  const Experts({Key? key}) : super(key: key);

  @override
  State<Experts> createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No experts available'),
          duration: Duration(seconds: 1),
        ));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: 'Experts'.text.xl.black.bold.make(),
      ),
      body: _isLoading
          ? ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return buildChatsShimmer();
              }).pOnly(top: 16, left: 16, right: 16)
          : null,
    );
  }

  Widget buildChatsShimmer() {
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
          ),
          const ShimmerWidget.rectangular(
            height: 5,
          ),
          ShimmerWidget.rectangular(
            height: 5,
            width: screenWidth * 50,
          )
        ],
      ).p4(),
    ).pOnly(bottom: 4);
  }
}
