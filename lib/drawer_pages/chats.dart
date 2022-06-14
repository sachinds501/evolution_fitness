// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/shimmer_widget.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
   bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
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
      appBar: AppBar(
        title: 'Chats'.text.xl.black.bold.make(),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return buildChatsShimmer();
          }).pOnly(top: 16, left: 16, right: 16),
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
