// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildFoodShimmer();
          }),
    );
  }

  Widget buildFoodShimmer() {
    return const ListTile(
      leading: ShimmerWidget.circular(width: 64, height: 64),
      title: ShimmerWidget.rectangular(
        height: 16,
        width: 10,
      ),
      subtitle: ShimmerWidget.rectangular(height: 14),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      period: const Duration(seconds: 3),
      child: Container(
        decoration: ShapeDecoration(color: Colors.grey, shape: shapeBorder),
        width: width,
        height: height,
      ),
    );
  }
}
