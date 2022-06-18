// ignore_for_file: prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/dashboard/viewmore/viewmore.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewMoreContent extends StatefulWidget {
  const ViewMoreContent({Key? key}) : super(key: key);

  @override
  State<ViewMoreContent> createState() => _ViewMoreContentState();
}

class _ViewMoreContentState extends State<ViewMoreContent> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: 'Nutrients Details'.text.xl.black.bold.make(),
        ),
        body: _isLoading
            ? ViewMorePage()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  color: Colors.grey[50],
                                  child: "Consumed\n0\nCalories"
                                      .text
                                      .align(TextAlign.center)
                                      .xl
                                      .bold
                                      .makeCentered(),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height: 70,
                                  color: Colors.grey[50],
                                  child: "Remaining\n0\nCalories"
                                      .text
                                      .align(TextAlign.center)
                                      .xl
                                      .bold
                                      .makeCentered(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              VxTwoRow(
                                      left: Container(
                                        height: 12,
                                        color: Colors.blue,
                                      ).w10(context),
                                      right: "Carbs"
                                          .text
                                          .minFontSize(10)
                                          .maxFontSize(12)
                                          .make())
                                  .pOnly(left: 5),
                              VxTwoRow(
                                      left: Container(
                                        height: 12,
                                        color: Colors.pink,
                                      ).w10(context),
                                      right: "Protien"
                                          .text
                                          .minFontSize(10)
                                          .maxFontSize(12)
                                          .make())
                                  .pOnly(left: 5),
                              VxTwoRow(
                                      left: Container(
                                        height: 12,
                                        color: Colors.orange,
                                      ).w10(context),
                                      right: "Fats"
                                          .text
                                          .minFontSize(10)
                                          .maxFontSize(12)
                                          .make())
                                  .pOnly(left: 5),
                            ],
                          ).p12(),
                          "Hello".text.make()
                          
                        ],
                      ),
                    ).wFull(context).hOneThird(context).cornerRadius(5).p16(),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: choices.length,
                          itemBuilder: (context, index) {
                            return SelectTile(choice: choices[index]);
                          }).pSymmetric(h: 16),
                    ),
                  ],
                ),
              ));
  }
}

class Choice {
  const Choice({required this.title, required this.gram});
  final String title;
  final double gram;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Protien', gram: 0),
  Choice(title: 'Carbs', gram: 0),
  Choice(title: 'Sugar', gram: 0),
  Choice(title: 'Fiber', gram: 0),
  Choice(title: 'Fat', gram: 0),
  Choice(title: 'Cholesterol', gram: 0),
  Choice(title: 'Sodium', gram: 0),
  Choice(title: 'Potassium', gram: 0),
];

class SelectTile extends StatefulWidget {
  const SelectTile({Key? key, required this.choice}) : super(key: key);
  final Choice choice;
  @override
  State<SelectTile> createState() => _SelectTileState();
}

class _SelectTileState extends State<SelectTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // height: 56,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.choice.title.text.bodyText2(context).make(),
              '${widget.choice.gram} g'.text.bodyText2(context).make(),
            ],
          ).h(35),
          Divider(
            color: Colors.blueGrey,
          )
        ],
      ).pSymmetric(h: 10),
    );
  }
}
