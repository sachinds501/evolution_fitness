// ignore_for_file: unnecessary_const, prefer_const_constructors

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
                      Stack(
                        children: [
                          Positioned(
                            top: 48,
                            left: 50,
                            child: CircleAvatar(
                              radius: 73,
                              backgroundColor: Colors.white,
                              child: Image.asset('assets/images/logo.jpg'),
                            ),
                          ),
                          Positioned(
                            top: 33,
                            left: 33,
                            child: VxCircle(
                              radius: 190,
                              backgroundColor: Colors.transparent,
                              child: CircularProgressIndicator(
                                  strokeWidth: 10, color: bgcolor, value: 1),
                            ),
                          ),
                          Positioned(
                            top: 17,
                            left: 17,
                            child: VxCircle(
                              radius: 222,
                              backgroundColor: Colors.transparent,
                              child: CircularProgressIndicator(
                                  strokeWidth: 10, color: bgcolor, value: 1),
                            ),
                          ),
                          VxCircle(
                            radius: 255,
                            backgroundColor: Colors.transparent,
                            child: const CircularProgressIndicator(
                                strokeWidth: 10,
                                color: Colors.lightBlueAccent,
                                value: 1),
                          ),
                        ],
                      ).p16(),
                      VxTwoColumn(
                        top: GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: List.generate(
                            choices.length,
                            (index) {
                              return Center(
                                child: SelectCard(choice: choices[index]),
                              );
                            },
                          ),
                        ),
                        bottom: GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          children: List.generate(
                            choices2.length,
                            (index) {
                              return Center(
                                child: SelectCard2(
                                  choice2: choices2[index],
                                ),
                              );
                            },
                          ),
                        ),
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

class Choice {
  const Choice(
      {required this.title, required this.caption, required this.color});
  final String title;
  final String caption;
  final Color color;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '0/0', caption: 'Burned', color: Colors.red),
  const Choice(title: '1,191', caption: 'kCal Left', color: Colors.lightBlue),
  const Choice(title: '0/1,191', caption: 'Consumed', color: Colors.white54),
];

class SelectCard extends StatefulWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  // final TextStyle textStyle = Theme.of(context)./;

  @override
  Widget build(BuildContext context) {
    final screenWidth = (MediaQuery.of(context).size.width / 100);

    return Scaffold(
      body: Card(
          elevation: 0,
          color: Colors.white,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  widget.choice.title.text.xl2.bold.make(),
                  SizedBox(
                    width: screenWidth * 24,
                    child: LinearProgressIndicator(
                      color: widget.choice.color,
                      value: 1,
                      minHeight: 6,
                    ),
                  ).cornerRadius(10),
                  widget.choice.caption.text.caption(context).make()
                ]),
          )),
    );
  }
}

class Choice2 {
  const Choice2(
      {required this.title, required this.caption, required this.icon});
  final String title;
  final String caption;
  final Image icon;
}

List<Choice2> choices2 = <Choice2>[
  Choice2(
      title: '390',
      caption: 'Carbs(g) Left',
      icon: Image.network(
          'https://icons.veryicon.com/png/o/food--drinks/vegetables-1/broccoli-2.png')),
  Choice2(
      title: '210',
      caption: 'Protine(g) Left',
      icon: Image.network(
          'https://cdn-icons-png.flaticon.com/512/129/129998.png')),
  Choice2(
      title: '93.33',
      caption: 'Fats(g) Left',
      icon: Image.network(
          'https://icon-library.com/images/cheese-icon/cheese-icon-10.jpg')),
];

class SelectCard2 extends StatefulWidget {
  const SelectCard2({Key? key, required this.choice2}) : super(key: key);
  final Choice2 choice2;

  @override
  State<SelectCard2> createState() => _SelectCard2State();
}

class _SelectCard2State extends State<SelectCard2> {
  // final TextStyle textStyle = Theme.of(context)./;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
          elevation: 0,
          color: Colors.white,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 25, width: 25, child: widget.choice2.icon),
                  widget.choice2.title.text.xl3.bold.make(),
                  widget.choice2.caption.text.caption(context).make()
                ]),
          )),
    );
  }
}
