import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/all_widgets.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  State<BloodPressure> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<BloodPressure> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: myAppBar(context, 'Blood Pressure'),
      floatingActionButton: myfloatingButton(context, 2, 'Blood Pressure'),
      body: _isLoading
          ? const ViewAddRecord()
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.redAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Note down Blood Pressure"
                            .text
                            .align(TextAlign.center)
                            .white
                            .xl3
                            .makeCentered(),
                        "Set your target to stay active and healthy"
                            .text
                            .align(TextAlign.center)
                            .white
                            .headline6(context)
                            .makeCentered()
                      ],
                    ).pSymmetric(v: 40).px(20),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title: 'Blood Pressure Level'
                        .text
                        .bodyText1(context)
                        .red500
                        .makeCentered(),
                    subtitle: TextFormField(
                      // controller: _confirmPass,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                      decoration: myUnderlineInputDec(),
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      cursorHeight: 30,
                      cursorWidth: 3,
                      onFieldSubmitted: (value) {},
                      onSaved: (value) {
                        setState(() {});
                      },
                    ).h(40),
                  ).py(20),
                ],
              ),
            ).cornerRadius(5).p16(),
    );
  }
}
