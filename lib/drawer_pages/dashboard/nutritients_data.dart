import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

GridView nutritientsData() {
  return GridView.count(
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
  );
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
      icon: Image.asset('assets/images/broccoli-2.png')),
  Choice2(
      title: '210',
      caption: 'Protine(g) Left',
      icon: Image.asset('assets/images/eggs.png')),
  Choice2(
      title: '93.33',
      caption: 'Fats(g) Left',
      icon: Image.asset('assets/images/cheese.jpg')),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Spacer(),
                  SizedBox(height: 24, width: 24, child: widget.choice2.icon)
                      .pSymmetric(v: 3),
                  widget.choice2.title.text
                      .fontWeight(FontWeight.w500)
                      .xl2
                      .make()
                      .pSymmetric(v: 2),
                  widget.choice2.caption.text.caption(context).make()
                ]),
          )),
    );
  }
}
