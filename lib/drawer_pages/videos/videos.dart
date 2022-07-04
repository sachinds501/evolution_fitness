// ignore_for_file: use_key_in_widget_constructors, avoid_print
import 'package:evolution_fitness/drawer_pages/videos/video_shimmer.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_api/youtube_api.dart';
import 'video_info.dart';

class Videos extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  bool _isLoading = false;
  static String key = "AIzaSyDCtA9CExtP7AER8X3mrmwCCJvUes0CqPU";

  YoutubeAPI youtube = YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    String query = "Athlean X";
    videoResult = await youtube.search(query, order: 'relevance');
    videoResult = await youtube.nextPage();
    if (mounted) {
      setState(() {});
    }
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
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        'Videos',
      ),
      body: _isLoading == true
          ? buildVideoShimmer(context)
          : ListView(
              children: videoResult.map<Widget>(listItem).toList(),
            ).p16(),
    );
  }

  Widget listItem(YouTubeVideo video) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(SizeTransition5(
            VideoInfo(
              video: video,
            ),
          ));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Image.network(
                video.thumbnail.medium.url ?? '',
              ),
            ),
            Container(
              color: Colors.white,
              child: video.title.text.black.make(),
            ).p8(),
          ],
        ).cornerRadius(5),
      ),
    ).pOnly(bottom: 12);
  }
}
