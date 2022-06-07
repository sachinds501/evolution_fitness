import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
            title: 'DashBoard'.text.headline6(context).make(),
            iconTheme: const IconThemeData(),
            actions: [
              IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.bell_fill))
                  .pOnly(right: 5),
            ]),
        drawer: const MyDrawer(),
        body: Container());
  }
}
