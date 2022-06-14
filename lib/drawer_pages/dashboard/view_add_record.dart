// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/shimmer_widget.dart';

class ViewAddRecord extends StatefulWidget {
  const ViewAddRecord({Key? key, this.appBarTitle}) : super(key: key);
  final String? appBarTitle;

  @override
  State<ViewAddRecord> createState() => _ViewAddRecordState();
}

class _ViewAddRecordState extends State<ViewAddRecord> {
  @override
  Widget build(BuildContext context) {
    final String appBarTitle = widget.appBarTitle.toString();
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        children: [
          DateFormat('EEEE, dd MMMM')
              .format(DateTime.now())
              .toString()
              .text
              .xl
              .bold
              .make(),
          buildChatsShimmer(),
        ],
      ).pOnly(top: 10),
    );
  }

  Widget buildChatsShimmer() {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
                  color: Colors.white,
                  child: ShimmerWidget.rectangular(
                    height: screenHeight * 25,
                  ).p8())
              .h32(context),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const ShimmerWidget.circular(
                height: 55,
                width: 55,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(
                        height: 10,
                        width: screenWidth * 60,
                      ).cornerRadius(5),
                      ShimmerWidget.rectangular(
                        height: 8,
                        width: screenWidth * 55,
                      ).cornerRadius(5),
                    ],
                  ).pSymmetric(h: 16),
                ),
              ),
            ],
          ).pSymmetric(h: 12),
          SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  height: 8,
                  width: screenWidth * 70,
                ).cornerRadius(5),
                const ShimmerWidget.rectangular(
                  height: 8,
                ).cornerRadius(5),
                ShimmerWidget.rectangular(
                  height: 8,
                  width: screenWidth * 80,
                ).cornerRadius(5),
              ],
            ),
          ).pSymmetric(h: 12),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 8,
                    width: screenWidth * 70,
                  ).cornerRadius(5),
                  const ShimmerWidget.rectangular(
                    height: 8,
                  ).cornerRadius(5),
                  ShimmerWidget.rectangular(
                    height: 8,
                    width: screenWidth * 80,
                  ).cornerRadius(5),
                ],
              ))
        ],
      ),
    ).pOnly(bottom: 4).cornerRadius(5);
  }
}
