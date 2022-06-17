// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:evolution_fitness/drawer_pages/videos/video_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  YoutubePlayerController? _ytbPlayerController;
  bool _isLoading = false;

  List<YoutubeModel> videosList = const [
    YoutubeModel(id: 1, youtubeId: '2dcLiaXI6Ro'),
    YoutubeModel(id: 2, youtubeId: 'mNcC4Qin-h8'),
    YoutubeModel(id: 3, youtubeId: 'zzD80vCLq0Y'),
    YoutubeModel(id: 4, youtubeId: 'PkDOH359gbs'),
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
              initialVideoId: videosList[widget.index].youtubeId,
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
          : SingleChildScrollView(
              child: YoutubeValueBuilder(
                controller: _ytbPlayerController,
                builder: (context, value) => SizedBox(
                  child: Column(
                    children: [
                      _buildYtbView(),

                      SizedBox(
                        height: 50,
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
                        ],
                      ).p12(),
                      _buildMoreVideoTitle(),
                      _buildMoreVideosView(),
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
      aspectRatio: 16 / 16,
      child: _ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController)
          : Center(child: CircularProgressIndicator()),
    );
  }

  _buildMoreVideoTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 182, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            "More videos",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _buildMoreVideosView() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: videosList.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final _newCode = videosList[index].youtubeId;
                  _ytbPlayerController!.load(_newCode);
                  _ytbPlayerController!.stop();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  margin: EdgeInsets.symmetric(vertical: 7),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          child: Image.network(
                            "https://img.youtube.com/vi/${videosList[index].youtubeId}/0.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
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
