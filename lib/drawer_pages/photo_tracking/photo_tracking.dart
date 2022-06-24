// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/drawer_pages/photo_tracking/add_recipe.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/shimmer_widget.dart';

class PhotoTracking extends StatefulWidget {
  const PhotoTracking({Key? key}) : super(key: key);

  @override
  State<PhotoTracking> createState() => _PhotoTrackingState();
}

class _PhotoTrackingState extends State<PhotoTracking> {
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
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: "PhotoTracking".text.headline3(context).make(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add food',
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.of(context).push(SizeTransition5(const Recipe()));
        },
        child: const Icon(
          Icons.food_bank,
        ),
      ),
      body: _isLoading
          ? ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return buildPhotoTrackinghimmer();
              }).pOnly(top: 16, left: 16, right: 16)
          : Container(
              color: Colors.white,
              child: "No Recepie Available".text.make(),
            ).wFull(context).p16(),
    );
  }

  Widget buildPhotoTrackinghimmer() {
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