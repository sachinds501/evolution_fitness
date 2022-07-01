import 'package:evolution_fitness/drawer_pages/dashboard/routines/food/today_food.dart';
import 'package:evolution_fitness/drawer_pages/gym_exercise.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../utils/routes.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: myfloatingButton(context, 2, 'Diet'),
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(title: "Feeds".text.headline3(context).make(), actions: [
        IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRoutes.notificationsRoute);
                },
                icon: const Icon(CupertinoIcons.bell_fill))
            .pOnly(right: 5),
      ]),
      body:
          ListView(physics: const ScrollPhysics(), shrinkWrap: true, children: [
        // exerciseCard(),
        for (int i = 0; i < 3; i++)
          Column(
            children: [
              foodCard().pOnly(bottom: 10),
              exerciseCard().pOnly(bottom: 10),
            ],
          )
        // exerciseCard(),
      ]).p16(),
    );
  }

  Widget foodCard() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/healthyfoods.jpg',
            fit: BoxFit.cover,
          ),
          sh(20),
          feedFoodgrid(),
          sh(20),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '14-Days Clean-Eating Meal Plan'.text.size(16).make(),
                'Eating clean is the great way to up your intake of good-for-you foods'
                    .text
                    .size(10)
                    .make(),
                sh(10),
                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context)
                                .push(SizeTransition5(const TodayFood()));
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                            shape: MaterialStateProperty.all(
                              const StadiumBorder(),
                            ),
                          ),
                          child: 'VIEW MORE'.text.make())
                      .wh(110, 30),
                )
              ],
            ).pSymmetric(h: 16),
          ),
          sh(10),
        ],
      ),
    ).cornerRadius(8).wFull(context);
  }

  Widget exerciseCard() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/exerciseCard.jpg',
            fit: BoxFit.fill,
          ).h(220),
          ListTile(
            leading: const Icon(
              Icons.sports_gymnastics_outlined,
              color: Colors.black,
              size: 35,
            ),
            title: 'Exercise'.text.make(),
            subtitle: '2000 Cal/Day Burning'.text.caption(context).make(),
          ),
          Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '14-Days Cardio Fitness'.text.size(16).make(),
                'Want to lose weight and tone up? This plan is designed to give maximum calorie burn burn in two weeks.\nHigh energy cardio workouts combined with strength and rebalance classes deliver results fast.'
                    .text
                    .size(10)
                    .make(),
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(SizeTransition5(const GymExercise()));
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepPurple),
                            shape: MaterialStateProperty.all(
                              const StadiumBorder(),
                            ),
                          ),
                          child: 'VIEW MORE'.text.make())
                      .wh(110, 30),
                ),
              ],
            ).pSymmetric(h: 16),
          ),
          sh(20),
        ],
      ),
    ).cornerRadius(8).wFull(context);
  }
}

GridView feedFoodgrid() {
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
      title: '204',
      caption: 'Carbs(g)',
      icon: Image.asset('assets/images/broccoli-2.png')),
  Choice2(
      title: '105',
      caption: 'Protien(g)',
      icon: Image.asset('assets/images/eggs.png')),
  Choice2(
      title: '25',
      caption: 'Fats(g)',
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
    return Container(
        alignment: Alignment.center,
        height: 80,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 35, width: 35, child: widget.choice2.icon),
              widget.choice2.caption.text.headline6(context).make(),
              widget.choice2.title.text.headline6(context).make(),
            ]));
  }
}
