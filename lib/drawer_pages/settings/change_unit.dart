import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangeUnit extends StatefulWidget {
  const ChangeUnit({Key? key}) : super(key: key);

  @override
  State<ChangeUnit> createState() => _ChangeUnitState();
}

class _ChangeUnitState extends State<ChangeUnit> {
  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Change Unit'),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/images/us.png',
                filterQuality: FilterQuality.low,
              ).circle(radius: 50, backgroundColor: Colors.transparent),
              shape: const Border(bottom: BorderSide(width: 1)),
              title: 'US System'.text.bodyText2(context).make(),
              subtitle: 'feet, inches, pound, calories'
                  .text
                  .headline6(context)
                  .caption(context)
                  .make(),
              trailing: Radio(
                  value: 0,
                  groupValue: val,
                  onChanged: (int? value) {
                    setState(() {
                      val = value!;
                    });
                  }),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              tileColor: Colors.white,
              leading: Image.asset(
                'assets/images/europe.jpg',
                filterQuality: FilterQuality.low,
              ).circle(radius: 50, backgroundColor: Colors.transparent),
              title: 'European System'.text.bodyText2(context).make(),
              subtitle: 'cm, kg, calories'
                  .text
                  .headline6(context)
                  .caption(context)
                  .make(),
              trailing: Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (int? value) {
                    setState(() {
                      val = value!;
                    });
                    val = value!;
                  }),
            ),
          ],
        ).p16(),
      ).cornerRadius(8),
    );
  }
}
