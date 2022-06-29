// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:evolution_fitness/drawer_pages/videos/video_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../widgets/all_widgets.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key, required this.video}) : super(key: key);
  final YouTubeVideo video;
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
              initialVideoId: widget.video.id!,
              params: const YoutubePlayerParams(
                showFullscreenButton: true,
                autoPlay: false,
                enableCaption: true,
                showControls: true,
              ),
            );
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
                      Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: Text(
                                    widget.video.title,
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  subtitle: Text(
                                    'Channel: ${widget.video.channelTitle}',
                                  ),
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    'Channel:'.text.bold.make(),
                                    widget.video.channelTitle.text.make(),
                                    sh(10),
                                    'Description:'.text.bold.make(),
                                    widget.video.description!.text.make(),
                                    sh(10),
                                    'Url:'.text.bold.make(),
                                    widget.video.url.text.make(),
                                    sh(10),
                                  ],
                                ),
                                sh(10),
                                Row(children: [
                                  "Duration".text.bold.make(),
                                  widget.video.duration!.text.make(),
                                ]),
                              ],
                            ).p8(),
                          ).cornerRadius(5).p16(),
                        ],
                      ),
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
}

class YoutubeModel {
  final int id;
  final String youtubeId;

  const YoutubeModel({required this.id, required this.youtubeId});
}
