import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/all_widgets.dart';

class WaterRoutine extends StatefulWidget {
  const WaterRoutine({Key? key}) : super(key: key);

  @override
  State<WaterRoutine> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<WaterRoutine> {
  String appBarTitle = 'Water';
  bool _isLoading = false;
  int itemCount = 0;

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
        'Water',
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
                    color: Colors.purple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Record Water"
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
                  Column(children: [
                    'Add glass of water (each 100 ml)'
                        .text
                        .bodyText1(context)
                        .purple500
                        .makeCentered(),
                    Container(
                      color: Colors.purple,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          itemCount != 0
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => setState(() => itemCount--),
                                )
                              : Container().p(8),
                          Container(
                                  color: Colors.white,
                                  child: itemCount
                                      .toString()
                                      .text
                                      .xl2
                                      .black
                                      .make()
                                      .px(8)
                                      .py(4))
                              .cornerRadius(5),
                          IconButton(
                              icon: const Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () => setState(() => itemCount++))
                        ],
                      ),
                    ).cornerRadius(25).py(8),
                    sh(10),
                    'Total water intake : ${itemCount * 100} ml'.text.make(),
                  ]).py(20),
                ],
              )).cornerRadius(5).p16(),
    );
  }
}
