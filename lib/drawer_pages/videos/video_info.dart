// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:evolution_fitness/drawer_pages/videos/video_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  YoutubePlayerController? _ytbPlayerController;
  bool _isLoading = false;
  int i = 0;

  List<YoutubeModel> videosList = const [
    YoutubeModel(id: 1, youtubeId: '6_XsB_BQYss'),
    YoutubeModel(id: 2, youtubeId: '77lcmg9_x_w'),
    YoutubeModel(id: 3, youtubeId: 'EuayIecZVHM'),
    YoutubeModel(id: 4, youtubeId: 'VVvVxMOrh14'),
  ];

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  void dispose() {
    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController!.close();
    super.dispose();
  }

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(
          () {
            _ytbPlayerController = YoutubePlayerController(
              initialVideoId: videosList[i].youtubeId,
              params: const YoutubePlayerParams(
                showFullscreenButton: true,
                autoPlay: false,
                enableCaption: true,
                showControls: true,
              ),
            );
            // YoutubeValueBuilder(
            //   controller: _ytbPlayerController,
            //   builder: (context, value) {
            //     return _ytbPlayerController!.metadata.title.text.xl.black
            //         .make();
            //   },
            // );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: "Videos".text.xl.black.bold.make(),
      ),
      body: _isLoading
          ? buildVideoShimmer(context)
          : YoutubeValueBuilder(
              controller: _ytbPlayerController,
              builder: (context, value) => SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      _buildYtbView(),

                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ytbPlayerController!.metadata.title.text.xl.blue500
                              .make(),
                          SizedBox(
                            height: 15,
                          ),
                          'Channel: ${_ytbPlayerController!.metadata.author}'
                              .text
                              .make(),
                          SizedBox(
                            height: 15,
                          ),
                          'Duration: ${(_ytbPlayerController!.metadata.duration.inSeconds / 60).floor()} mins ${_ytbPlayerController!.metadata.duration.inSeconds % 60} seconds'
                              .text
                              .make(),
                        ],
                      ).p12(),
                      // _buildMoreVideoTitle(),
                      _buildMoreVideosView(context),
                      // _ytbPlayerController!.metadata.title.
                    ],
                  ),
                ).hFull(context),
              ),
            ),
    );
  }

  _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController)
          : Center(child: CircularProgressIndicator()),
    );
  }

  _buildMoreVideosView(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: videosList.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    final _newCode = videosList[index].youtubeId;
                    _ytbPlayerController!.load(_newCode);
                    _ytbPlayerController!.stop();
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
                          child: Expanded(
                            child: Image.network(
                              "https://img.youtube.com/vi/${videosList[index].youtubeId}/0.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                videosList[index]
                                    .youtubeId
                                    .text
                                    .blue600
                                    .make()
                                    .p12()),
                      ],
                    ).pOnly(bottom: 4),
                  ).cornerRadius(5),
                ),
              ).pSymmetric(v: 5);
            }),
      ),
    );
  }
}

class YoutubeModel {
  final int id;
  final String youtubeId;

  const YoutubeModel({required this.id, required this.youtubeId});
}
