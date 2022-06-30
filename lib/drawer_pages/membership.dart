// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/shimmer_widget.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

bool _viewMoreIsPressed = false;

class _MembershipPageState extends State<MembershipPage> {
  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    _viewMoreIsPressed = false;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: myAppBar(context, 'Membership'),
      body: _isLoading
          ? ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, value) => Divider(),
              itemBuilder: (context, index) {
                return buildMembershipShimmer();
              })
          : SingleChildScrollView(
              child: Column(
                children: [
                  _viewMoreIsPressed == false
                      ? SelectCard(
                          choice: choices[0],
                          index: 0,
                        )
                      : ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: choices.length,
                          itemBuilder: (context, index) =>
                              SelectCard(choice: choices[index], index: index)),
                  if (_viewMoreIsPressed == false)
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            _viewMoreIsPressed = true;
                          },
                        );
                      },
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
                    ).wh(110, 50).pOnly(top: 20),
                ],
              ),
            ),
    );
  }

  Widget buildMembershipShimmer() {
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

class Choice {
  const Choice(
      {required this.title, required this.subtitle, required this.buttonTitle});
  final String title;
  final String subtitle;
  final String buttonTitle;
}

const List<Choice> choices = <Choice>[
  Choice(
      title: "EFA=12 Months\n365 Days", subtitle: "365", buttonTitle: "Active"),
  Choice(title: 'EFA-1 Day(Guest)', subtitle: "1", buttonTitle: "300"),
  Choice(title: 'EFA-1 Month', subtitle: "30   ", buttonTitle: "3000"),
  Choice(title: 'EFA-3 Months', subtitle: "90  ", buttonTitle: "6000"),
  Choice(title: 'EFA-6 Months', subtitle: "180 ", buttonTitle: "9000"),
  Choice(title: 'EFA-2 Months', subtitle: "60  ", buttonTitle: "4000"),
  Choice(title: 'EFA-5 Months', subtitle: "150 ", buttonTitle: "7000"),
  Choice(title: 'EFA-4 Months', subtitle: "120 ", buttonTitle: "5000"),
  Choice(title: 'EFA-10 Months', subtitle: "300", buttonTitle: "10000"),
  Choice(title: 'EFA-11 Months', subtitle: "330", buttonTitle: "11000"),
  Choice(title: 'EFA-15 Months', subtitle: "15 ", buttonTitle: "1000"),
];

class SelectCard extends StatefulWidget {
  const SelectCard({Key? key, required this.choice, required this.index})
      : super(key: key);
  final Choice choice;
  final int index;

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          shadowColor: Colors.black,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                // contentPadding: EdgeInsets.all(5),
                leading: Container(
                  color: Colors.blue,
                  child: Icon(
                    Icons.card_membership,
                    color: Colors.white,
                    size: 30,
                  ),
                ).cornerRadius(10).wh(60, 60),
                title: widget.choice.title.text.blue500
                    .minFontSize(10)
                    .maxFontSize(14)
                    .bold
                    .make()
                    .pOnly(top: 10),
                subtitle: "Rs. ${widget.choice.subtitle}\n".text.bold.make(),
              ),
              ButtonBar(
                children: [
                  if (widget.index == 0)
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          widget.choice.buttonTitle.text.makeCentered(),
                        ],
                      ),
                    ).wFull(context).h(30),
                  if (_viewMoreIsPressed == true && widget.index != 0)
                    ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {},
                            child: 'Price: ${widget.choice.buttonTitle}'
                                .text
                                .bold
                                .makeCentered())
                        .h(30)
                ],
              )
            ],
          ),
        )
            .cornerRadius(10)
            .wFull(context)
            .h((_viewMoreIsPressed == true && widget.index != 0) ? 140 : 160),
      ],
    ).pSymmetric(h: 12, v: 6);
  }
}
