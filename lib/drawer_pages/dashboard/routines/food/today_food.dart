import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class TodayFood extends StatefulWidget {
  const TodayFood({Key? key}) : super(key: key);

  @override
  State<TodayFood> createState() => _TodayFoodState();
}

class _TodayFoodState extends State<TodayFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Today's Food"),
      body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: DateFormat('EEEE, dd MMMM')
                  .format(DateTime.now())
                  .toString()
                  .text
                  .xl
                  .white
                  .bold
                  .make()
                  .px(30)
                  .py(14),
            ).centered(),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) =>
                  foodCard(context, index).pOnly(bottom: 10),
            )
          ])).p16(),
    );
  }
}

Widget foodCard(BuildContext context, index) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              cardIcon[index],
            ).wh(30, 30),
            sw(10),
            title[index].text.xl.bold.make()
          ],
        ).h(35).px(12),
        const Divider(
          thickness: 2,
        ),
        tileTitle[index].isNotEmpty
            ? Wrap(children: [
                sw(10),
                'Your ${title[index]} includes'.text.bodyText1(context).make(),
                sw(10),
                '124 Kcal'
                    .text
                    .bodyText1(context)
                    .color(Colors.lightBlue)
                    .make(),
              ]).px(12)
            : 'Not yet recommended!'.text.bodyText1(context).make().px(12),
        sh(25),
        if (tileTitle[index].isNotEmpty) feedFoodgrid().px(12),
        if (tileTitle[index].isNotEmpty) sh(25),
        if (tileTitle[index].isNotEmpty)
          const Divider(
            thickness: 2,
          ),
        if (tileTitle[index].isNotEmpty)
          ListTile(
            trailing: const Icon(Icons.access_time),
            title: tileTitle[index].text.bodyText2(context).make(),
            subtitle: tileCaption[index].text.make(),
          ),
        Container(
          height: 40,
          alignment: Alignment.center,
          child: ElevatedButton.icon(
              icon: const Icon(
                Icons.access_time,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () async {},
              style: myButtonStyle(),
              label: 'Add Food'.text.headline6(context).make()),
        ),
        sh(10),
      ],
    ),
  ).cornerRadius(8).wFull(context);
}

List<String> cardIcon = <String>[
  'assets/images/breakfast.png',
  'assets/images/morningSnacks.png',
  'assets/images/chicken.png',
  'assets/images/eveningSnacks.png',
  'assets/images/dinner.jpg',
  'assets/images/morningSnacks.png',
];

List<String> title = <String>[
  'BreakFast',
  'Morning Snacks',
  'Lunch',
  'Evening Snacks',
  'Dinner',
  'Night Snacks'
];

List<String> tileTitle = <String>[
  'Palak Thepla',
  '',
  'Masala oats',
  '',
  'Roasted cauliflower soup',
  '',
];

List<String> tileCaption = <String>[
  '1 medium = 252 cal',
  '',
  '1 cup = 157 cal',
  '',
  'a cup = 62 cal',
  '',
];

GridView feedFoodgrid() {
  return GridView.count(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    crossAxisCount: 4,
    children: List.generate(
      choices2.length,
      (index) {
        return Center(
          child: SelectGridData2(
            choice2: choices2[index],
          ),
        );
      },
    ),
  );
}

class Choice2 {
  const Choice2({
    required this.gridItemTitle,
    required this.gridItemCaption,
    required this.icon,
  });
  final String gridItemTitle;
  final String gridItemCaption;
  final Image icon;
}

List<Choice2> choices2 = <Choice2>[
  Choice2(
      gridItemTitle: '204',
      gridItemCaption: 'Carbs',
      icon: Image.asset('assets/images/broccoli-2.png')),
  Choice2(
      gridItemTitle: '105',
      gridItemCaption: 'Protien',
      icon: Image.asset('assets/images/eggs.png')),
  Choice2(
      gridItemTitle: '25',
      gridItemCaption: 'Fats',
      icon: Image.asset('assets/images/cheese.jpg')),
  Choice2(
      gridItemTitle: '56',
      gridItemCaption: 'Fiber',
      icon: Image.asset('assets/images/fiber.png')),
];

class SelectGridData2 extends StatefulWidget {
  const SelectGridData2({Key? key, required this.choice2}) : super(key: key);
  final Choice2 choice2;

  @override
  State<SelectGridData2> createState() => _SelectGridData2State();
}

class _SelectGridData2State extends State<SelectGridData2> {
  // final TextStyle textStyle = Theme.of(context)./;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 35, width: 35, child: widget.choice2.icon),
          widget.choice2.gridItemCaption.text.bodyText1(context).make(),
          '${widget.choice2.gridItemTitle} Gms'.text.headline6(context).make(),
        ],
      ).wFull(context),
    );
  }
}
