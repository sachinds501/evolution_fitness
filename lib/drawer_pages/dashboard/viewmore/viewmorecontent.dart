// ignore_for_file: prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/dashboard/viewmore/viewmore.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
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

  final dataMap = <String, double>{
    'Protien': 0.44,
    'Carbs': 0.93,
    'Fats': 0.07,
  };

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  // height: 70,
                                  color: Colors.grey[50],
                                  child: RichText(
                                      text: TextSpan(children: const [
                                    TextSpan(
                                        text: "Consumed\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 17)),
                                    TextSpan(
                                        text: "      0\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue,
                                            fontSize: 22)),
                                    TextSpan(
                                        text: "  Calories",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 17))
                                  ])),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  // height: 70,
                                  color: Colors.grey[50],
                                  child: RichText(
                                      text: TextSpan(children: const [
                                    TextSpan(
                                        text: "Remaining\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 17)),
                                    TextSpan(
                                        text: "      0\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue,
                                            fontSize: 22)),
                                    TextSpan(
                                        text: "  Calories",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 17))
                                  ])),
                                ),
                              ),
                            ],
                          ).h(80),
                          Flexible(
                            child: SizedBox(
                              height: 160,
                              child: PieChart(
                                ringStrokeWidth: 35,
                                chartLegendSpacing: 30,
                                legendOptions: LegendOptions(
                                    legendPosition: LegendPosition.top,
                                    showLegendsInRow: true,
                                    legendShape: BoxShape.rectangle),
                                chartType: ChartType.ring,
                                dataMap: dataMap,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ).wFull(context).cornerRadius(5).p16(),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
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
  Choice(title: 'Protien', gram: 0.44),
  Choice(title: 'Carbs', gram: 0.93),
  Choice(title: 'Sugar', gram: 0),
  Choice(title: 'Fiber', gram: 0),
  Choice(title: 'Fat', gram: 0.07),
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
