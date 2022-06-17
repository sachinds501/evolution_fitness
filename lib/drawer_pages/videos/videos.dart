// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/drawer_pages/videos/video_shimmer.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'video_info.dart';

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
          itemCount: _isLoading ? 2 : choices.length,
          itemBuilder: (context, index) {
            return _isLoading
                ? buildVideoShimmer(context)
                : GetVideos(choice: choices[index], index: index);
          }).pSymmetric(v: 16, h: 16),
    );
  }
}

class Choice {
  const Choice({this.vi, required this.caption, required this.image});

  final String caption;
  final Image image;
  final VideoInfo? vi;
}

List<Choice> choices = <Choice>[
  Choice(
      caption:
          '32 Minutes Home Cardio Workout with No Equipment - Calorie Blasting Cardio Training',
      image: Image.network(
        'https://assets.sweat.com/html_body_blocks/images/000/016/860/original/CardioAtHome_en198c593a6da46c6f07deb08e9ee740fc.jpg?1623214037',
        fit: BoxFit.fill,
      )),
  Choice(
      caption: 'Aerobic Dance to loose weight',
      image: Image.network(
        'https://goodspaguide.co.uk/images/uploads/Features/Aerobics/aerobics-class.jpg',
        fit: BoxFit.fill,
      )),
  Choice(
      caption: '70 Bodyweight Cardio Exercise',
      image: Image.network(
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hispanic-man-weightlifting-in-gymnasium-royalty-free-image-699086757-1539036020.jpg?resize=480:*',
        fit: BoxFit.fill,
      )),
  Choice(
      caption: 'Home Fat Loss Workout - Exercise to Lose Stomach Fat at Home',
      image: Image.network(
        'https://phantom-marca.unidadeditorial.es/8ecf81788454bfe7bef8a42302ee5d34/resize/1320/f/jpg/assets/multimedia/imagenes/2021/12/18/16398597754199.jpg',
        fit: BoxFit.fill,
      )),
];

class GetVideos extends StatefulWidget {
  const GetVideos({Key? key, required this.index, required this.choice})
      : super(key: key);
  final Choice choice;
  final int index;

  @override
  State<GetVideos> createState() => _GetVideosState();
}

class _GetVideosState extends State<GetVideos> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VideoInfo(index: widget.index),
          ));
        },
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
                child: Expanded(child: widget.choice.image),
              ),
              Container(
                  constraints: BoxConstraints(
                      minWidth: screenWidth * 100,
                      minHeight: screenHeight * 5,
                      maxWidth: screenWidth * 100),
                  color: Colors.white,
                  child:
                      //  YoutubeValueBuilder(
                      // controller: _ytbPlayerController,
                      // builder: (context, value) => _ytbPlayerController!
                      //     .metadata.title
                      widget.choice.caption.text.blue600.make().p12()),
            ],
          ).pOnly(bottom: 4),
        ).cornerRadius(5),
      ),
    ).pSymmetric(v: 5);
  }
}
