// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/dashboard/nutritients_data.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routine_list_view.dart';
import 'package:evolution_fitness/utils/routes.dart';
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
          Navigator.pushNamed(context, MyRoutes.splashscreenRoute);
        },
        color: Colors.white,
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        // width: screenWidth * 100,
                        // height: screenHeight * 72,
                        color: Colors.white,
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
                      ).cornerRadius(6).p16().wh(
                            screenWidth * 100,
                            screenHeight * 72,
                          )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.black)),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: 'View More'
                        .text
                        .bold
                        .maxFontSize(11)
                        .minFontSize(5)
                        .fontWeight(FontWeight.w600)
                        .black
                        .make(),
                  ).wh(110, 30),
                  SizedBox().h(30),
                  "Wedneshday, 8 June".text.bold.makeCentered(),
                  routineListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
