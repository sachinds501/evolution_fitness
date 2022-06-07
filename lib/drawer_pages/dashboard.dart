// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/dashboard/nutritients_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/drawer.dart';
import 'dashboard/cocurrent_indicators.dart';
import 'dashboard/linear_progressbars.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    final bgcolor = Theme.of(context).backgroundColor;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          title: 'DashBoard'.text.xl.black.bold.make(),
          iconTheme: const IconThemeData(),
          actions: [
            IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.bell_fill))
                .pOnly(right: 5),
          ]),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        displacement: 50,
        edgeOffset: 50,
        onRefresh: () async {
          //Do whatever you want on refrsh.Usually update the date of the listview
        },
        color: Colors.white,
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: screenHeight * 70,
                  width: screenWidth * 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cocurrentCircularProgressIndicators(bgcolor).p16(),
                      VxTwoColumn(
                        top: linearProgressBars(),
                        bottom: nutritientsData(),
                      ).p12(),
                    ],
                  ),
                ).cornerRadius(5).p16()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
