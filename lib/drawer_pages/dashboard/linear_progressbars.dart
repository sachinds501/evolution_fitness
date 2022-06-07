import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

GridView linearProgressBars() {
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
      {required this.title, required this.caption, required this.color});
  final String title;
  final String caption;
  final Color color;
}

const List<Choice> choices = <Choice>[
  Choice(title: '0/0', caption: 'Burned', color: Colors.red),
  Choice(title: '1,191', caption: 'kCal Left', color: Colors.lightBlue),
  Choice(title: '0/1,191', caption: 'Consumed', color: Colors.white54),
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
