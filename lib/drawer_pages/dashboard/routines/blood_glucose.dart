import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/all_widgets.dart';

class BloodGlucose extends StatefulWidget {
  const BloodGlucose({Key? key}) : super(key: key);

  @override
  State<BloodGlucose> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<BloodGlucose> {
  String appBarTitle = 'Blood Glucose';
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
      appBar: myAppBar(
        context,
        appBarTitle,
        action: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
          ).pOnly(right: 10)
        ],
      ),
      floatingActionButton: myfloatingButton(context, 1, appBarTitle),
      body: _isLoading
          ? const ViewAddRecord()
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.orangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Note down Blood Sugar"
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
                    title: 'Blood Sugar Level (mg/dl)'
                        .text
                        .bodyText1(context)
                        .orange500
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
