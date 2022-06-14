// ignore_for_file: prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/dashboard/view_add_record.dart';
import 'package:evolution_fitness/main.dart';
import 'package:evolution_fitness/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

ListView routineListView() {
  return ListView.builder(
    itemCount: choices.length,
    itemBuilder: (context, index) => SelectCard(choice: choices[index]),
    // scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const ScrollPhysics(),
  );
}

class Choice {
  const Choice(
      {this.nav,
      this.appBattitle,
      required this.elevatedButton,
      required this.captionUnit,
      required this.title,
      required this.caption,
      this.buttonTitle,
      required this.icon});
  final String title;
  final String caption;
  final String? buttonTitle;
  final String captionUnit;
  final bool elevatedButton;
  final Future? nav;
  final FaIcon icon;
  final String? appBattitle;
}

List<Choice> choices = <Choice>[
  Choice(
      title: 'Weekly Avg. Sleep',
      caption: '0 hr 0 min',
      buttonTitle: 'View',
      icon: FaIcon(
        FontAwesomeIcons.solidMoon,
        color: Colors.red,
        size: 26,
      ),
      elevatedButton: true,
      appBattitle: 'Sleep',
      // nav: navigatorKey.currentState!.pushNamed(MyRoutes.viewaddrecordRoute),
      captionUnit: ''),
  Choice(
      title: 'Food',
      caption: '0',
      buttonTitle: 'Add',
      icon: FaIcon(
        FontAwesomeIcons.kitchenSet,
        color: Colors.green,
        size: 26,
      ),
      captionUnit: '/ 5,125 cal',
      appBattitle: 'Diet',
      elevatedButton: true),
  Choice(
      title: 'Weight',
      caption: '56.9',
      buttonTitle: 'Record',
      icon: FaIcon(
        FontAwesomeIcons.weightScale,
        color: Colors.red,
        size: 26,
      ),
      captionUnit: '/ kg',
      appBattitle: 'Weight Update',
      elevatedButton: true),
  Choice(
      title: 'Water',
      caption: '0',
      buttonTitle: 'Record',
      icon: FaIcon(
        FontAwesomeIcons.glassWater,
        color: Colors.purple,
        size: 26,
      ),
      captionUnit: '/ 2000 ml',
      elevatedButton: true),
  Choice(
      title: 'Exercise',
      caption: '0',
      buttonTitle: 'View',
      icon: FaIcon(
        FontAwesomeIcons.personRunning,
        color: Colors.blue,
        size: 26,
      ),
      captionUnit: '/ 0 cal',
      elevatedButton: true),
  Choice(
      title: 'Steps',
      caption: '0 steps',
      buttonTitle: 'View',
      icon: FaIcon(
        FontAwesomeIcons.solidMoon,
        color: Colors.grey,
        size: 26,
      ),
      captionUnit: '/ 0 cal',
      elevatedButton: true),
  Choice(
      title: 'Blood Pressure',
      caption: '',
      buttonTitle: '',
      icon: FaIcon(
        FontAwesomeIcons.heartPulse,
        color: Colors.red,
        size: 26,
      ),
      elevatedButton: false,
      captionUnit: ''),
  Choice(
      title: 'Blood Glucose',
      caption: '',
      buttonTitle: '',
      icon: FaIcon(
        FontAwesomeIcons.droplet,
        color: Colors.orange,
        size: 26,
      ),
      elevatedButton: false,
      captionUnit: ''),
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
    // final screenWidth = (MediaQuery.of(context).size.width / 100);

    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.choice.icon,
              widget.choice.title.text.size(13).bold.make().pOnly(left: 10),
              Spacer(),
              if (widget.choice.elevatedButton == true)
                ElevatedButton(
                  onPressed: () {
                    navigatorKey.currentState!
                        .pushNamed(MyRoutes.viewaddrecordRoute);
                    ViewAddRecord(appBarTitle: widget.choice.appBattitle);
                    setState(() {});
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.black)),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                  ),
                  child: widget.choice.buttonTitle?.text.bold
                      .maxFontSize(11)
                      .minFontSize(5)
                      .fontWeight(FontWeight.w600)
                      .black
                      .make(),
                ).wh(82, 28),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.,

            crossAxisAlignment: widget.choice.elevatedButton == true
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,

            children: [
              widget.choice.caption.text.xl3.bold.make(),
              SizedBox(
                width: 10,
              ),
              widget.choice.elevatedButton == true
                  ? widget.choice.captionUnit.text
                      .caption(context)
                      .size(12)
                      .xl
                      .make()
                      .pOnly(bottom: 4)
                  : "Not Measured".text.caption(context).size(14).make(),
            ],
          ),
          // widget.choice.caption.text.bold.xl3.make(),
        ],
      ).pSymmetric(h: 16, v: 12),
    ).cornerRadius(6).pSymmetric(v: 7, h: 16).h(130);
  }
}
