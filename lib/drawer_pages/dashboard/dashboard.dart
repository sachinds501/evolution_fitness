// ignore_for_file: unnecessary_const, prefer_const_constructors, unrelated_type_equality_checks

import 'package:evolution_fitness/drawer_pages/dashboard/nutritients_data.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/routine_list_view.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/viewmore/viewmorecontent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/routes.dart';
import '../../widgets/drawer.dart';
import '../../widgets/elevated_button.dart';
import 'cocurrent_indicators.dart';
import 'linear_progressbars.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) => Scaffold(
        appBar: AppBar(title: "Dashboard".text.xl.black.bold.make(), actions: [
          IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(MyRoutes.notificationsRoute);
                  },
                  icon: const Icon(CupertinoIcons.bell_fill))
              .pOnly(right: 5),
        ]),
        drawer: const MyDrawer(),
        body: RefreshIndicator(
          color: Colors.black,
          displacement: 50,
          edgeOffset: 50,
          onRefresh: () async {
            //Do whatever you want on refrsh.Usually update the date of the listview
            Navigator.pushNamed(context, MyRoutes.dashboardRoute);
          },
          child: ListView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 100,
                      height: 600,
                      color: Colors.white,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CocurrentCPI().p16(),
                            VxTwoColumn(
                              top: linearProgressBars(),
                              bottom: nutritientsData(),
                            ),
                          ],
                        ),
                      ),
                    ).cornerRadius(6).p16(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewMoreContent(),
                          ),
                        );
                      },
                      style: myButtonStyle(),
                      child: 'View More'.text.size(11).black.bold.make(),
                    ),
                    SizedBox().h(30),
                    DateFormat('EEEE, dd MMMM')
                        .format(DateTime.now())
                        .toString()
                        .text
                        .bold
                        .makeCentered(),
                    routineListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
