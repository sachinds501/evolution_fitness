// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

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
        floatingActionButton: ElevatedButton(
          style: myButtonStyle(),
          onPressed: () {
            Navigator.of(context).push(SizeTransition5(const Recipe()));
          },
          child: 'Add food'.text.black.make(),
        ).objectBottomCenter(widthFactor: 3.35),
        body: _isLoading
            ? ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return buildPhotoTrackinghimmer();
                }).pOnly(top: 16, left: 16, right: 16)
            : ListView.separated(
                separatorBuilder: (BuildContext context, index) =>
                    const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                ),
                itemCount: 2,
                itemBuilder: ((context, index) => Card(
                      color: Colors.white,
                      elevation: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(SizeTransition5(
                            Recipe(
                                photo: foodPhoto[index],
                                title: foodItem[index]),
                          ));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              foodPhoto[index],
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ).centered(),
                            foodItem[index].text.xl.blue500.make().p12(),
                          ],
                        ).cornerRadius(5),
                      ),
                    ).pOnly(bottom: 5)),
              ).p16().wFull(context));
  }

  List<String> foodPhoto = <String>[
    'assets/images/vegetable_soup.jpg',
    'assets/images/fruit_salad.jpg',
  ];
  List<String> foodItem = <String>[
    'Vegetable Soup',
    'Fruit Salad',
  ];

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
