import 'package:evolution_fitness/main.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/blood_glucose.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/blood_pressure.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/exercise.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/food.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/sleep.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/steps.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/water.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/weight.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

ListView routineListView() {
  return ListView.builder(
    itemCount: choices.length,
    itemBuilder: (context, index) =>
        SelectCard(choice: choices[index], index: index),
    // scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const ScrollPhysics(),
  );
}

class Choice {
  const Choice({
    this.appBattitle,
    required this.elevatedButton,
    required this.captionUnit,
    required this.title,
    required this.caption,
    this.buttonTitle,
    required this.icon,
  });
  final String title;
  final String caption;
  final String? buttonTitle;
  final String captionUnit;
  final bool elevatedButton;
  final FaIcon icon;
  final String? appBattitle;
}

List<Choice> choices = const <Choice>[
  Choice(
      title: 'Weekly Avg. Sleep',
      caption: '7 hr 5 min',
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
      caption: '600',
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
      caption: '300',
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
      caption: '40',
      buttonTitle: 'View',
      icon: FaIcon(
        FontAwesomeIcons.personRunning,
        color: Colors.blue,
        size: 26,
      ),
      captionUnit: '/ 500 cal',
      elevatedButton: true),
  Choice(
      title: 'Steps',
      caption: '3210 steps',
      buttonTitle: 'View',
      icon: FaIcon(
        FontAwesomeIcons.solidMoon,
        color: Colors.grey,
        size: 26,
      ),
      captionUnit: '/ 500 cal',
      elevatedButton: true),
  Choice(
      title: 'Blood Pressure',
      caption: '120',
      buttonTitle: 'Record',
      icon: FaIcon(
        FontAwesomeIcons.heartPulse,
        color: Colors.red,
        size: 26,
      ),
      elevatedButton: true,
      captionUnit: 'mm Hg'),
  Choice(
      title: 'Blood Glucose',
      caption: '76',
      buttonTitle: 'Record',
      icon: FaIcon(
        FontAwesomeIcons.droplet,
        color: Colors.orange,
        size: 26,
      ),
      elevatedButton: true,
      captionUnit: 'mg/dl'),
];

const List<Widget> pages = <Widget>[
  SleepRoutine(),
  FoodRoutine(),
  Weight(),
  WaterRoutine(),
  ExerciseRoutine(),
  Steps(),
  BloodPressure(),
  BloodGlucose(),
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
  // final TextStyle textStyle = Theme.of(context)./;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = (MediaQuery.of(context).size.width / 100)

    return Container(
      color: Colors.white,
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
              const Spacer(),
              if (widget.choice.elevatedButton == true)
                ElevatedButton(
                  onPressed: () {
                    navigatorKey.currentState!
                        .push(SizeTransition5(pages[widget.index]));
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.black)),
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
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
              const SizedBox(
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
    ).cornerRadius(6).pSymmetric(v: 8, h: 16).h(130);
  }
}
