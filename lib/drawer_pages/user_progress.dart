// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/shimmer_widget.dart';
import '../widgets/all_widgets.dart';

class UserProgress extends StatefulWidget {
  const UserProgress({Key? key}) : super(key: key);

  @override
  State<UserProgress> createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
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
      appBar: myAppBar(context, 'User Progress'),
      backgroundColor: Theme.of(context).canvasColor,
      body: _isLoading
          ? ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildChatsShimmer();
              },
            ).pOnly(top: 16, left: 16, right: 16)
          : Container(
              alignment: Alignment.centerLeft,
              height: 50,
              color: Colors.white,
              child: "  Sorry, No Statastics available".text.make(),
            ).wFull(context).cornerRadius(8).p16(),
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
