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
        title: "Videos".text.xl.black.bold.make(),
      ),
      body: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _isLoading ? 2 : choices2.length,
          itemBuilder: (context, index) {
            return _isLoading
                ? buildVideoShimmer()
                : GetVideos(
                    choice2: choices2[index],
                  );
          }).pSymmetric(v: 16, h: 16),
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

class Choice2 {
  const Choice2({required this.caption, required this.image});

  final String caption;
  final Image image;
}

List<Choice2> choices2 = <Choice2>[
  Choice2(
      caption:
          '32 Minutes Home Cardio Workout with No Equipment - Calorie Blasting Cardio Training',
      image: Image.network(
        'https://assets.sweat.com/html_body_blocks/images/000/016/860/original/CardioAtHome_en198c593a6da46c6f07deb08e9ee740fc.jpg?1623214037',
        fit: BoxFit.fill,
      )),
  Choice2(
      caption: 'Aerobic Dance to loose weight',
      image: Image.network(
        'https://goodspaguide.co.uk/images/uploads/Features/Aerobics/aerobics-class.jpg',
        fit: BoxFit.fill,
      )),
  Choice2(
      caption: '70 Bodyweight Cardio Exercise',
      image: Image.network(
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hispanic-man-weightlifting-in-gymnasium-royalty-free-image-699086757-1539036020.jpg?resize=480:*',
        fit: BoxFit.fill,
      )),
  Choice2(
      caption: 'Home Fat Loss Workout - Exercise to Lose Stomach Fat at Home',
      image: Image.network(
        'https://phantom-marca.unidadeditorial.es/8ecf81788454bfe7bef8a42302ee5d34/resize/1320/f/jpg/assets/multimedia/imagenes/2021/12/18/16398597754199.jpg',
        fit: BoxFit.fill,
      )),
];

class GetVideos extends StatefulWidget {
  const GetVideos({Key? key, required this.choice2}) : super(key: key);
  final Choice2 choice2;
  @override
  State<GetVideos> createState() => _GetVideosState();
}

class _GetVideosState extends State<GetVideos> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Card(
      child: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxHeight: screenHeight * 25,
                  minWidth: screenWidth * 100,
                  minHeight: screenHeight * 25,
                  maxWidth: screenWidth * 100),
              color: Colors.white,
              child: Expanded(child: widget.choice2.image),
            ),
            Container(
              constraints: BoxConstraints(
                  minWidth: screenWidth * 100,
                  minHeight: screenHeight * 5,
                  maxWidth: screenWidth * 100),
              color: Colors.white,
              child: widget.choice2.caption.text.blue600.make().p12(),
            ),
          ],
        ).pOnly(bottom: 4),
      ).cornerRadius(5),
    ).pSymmetric(v: 5);
  }
}
