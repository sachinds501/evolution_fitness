import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget linearProgressBars() {
  return GridView.count(
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
  );
}

class Choice {
  const Choice(
      {required this.title,
      required this.caption,
      required this.color,
      required this.value});
  final String title;
  final String caption;
  final Color color;
  final double value;
}

const List<Choice> choices = <Choice>[
  Choice(title: '0/0', caption: 'Burned', color: Colors.redAccent, value: 1),
  Choice(
      title: '1,191',
      caption: 'kCal Left',
      color: Colors.lightBlueAccent,
      value: 1),
  Choice(
      title: '0 /1,191', caption: 'Consumed', color: Colors.blueGrey, value: 0),
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
      backgroundColor: Colors.white,
      body: Card(
          elevation: 0,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  widget.choice.title.text.xl.bold.make(),
                  SizedBox(
                    width: screenWidth * 26,
                    child: LinearProgressIndicator(
                      color: widget.choice.color,
                      backgroundColor: Theme.of(context).canvasColor,
                      value: widget.choice.value,
                      minHeight: 5,
                    ),
                  ).cornerRadius(10),
                  widget.choice.caption.text.caption(context).make()
                ]),
          )),
    );
  }
}
