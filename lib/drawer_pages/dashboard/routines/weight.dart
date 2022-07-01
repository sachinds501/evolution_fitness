import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/all_widgets.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  State<Weight> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<Weight> {
  bool _isLoading = false;

  double itemCount = 0.0;

  @override
  void initState() {
    _isLoading = true;
    itemCount = 51.6;
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
        'Weight',
        action: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
          ).pOnly(right: 10)
        ],
      ),
      floatingActionButton: myfloatingButton(context, 2, 'Weight'),
      body: _isLoading
          ? const ViewAddRecord()
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Record Weight"
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
                    'Set Weight (kg)'
                        .text
                        .bodyText1(context)
                        .red500
                        .makeCentered(),
                    Container(
                      color: Colors.red,
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
                                  onPressed: () =>
                                      setState(() => itemCount -= 0.1),
                                )
                              : Container().p(8),
                          Container(
                                  color: Colors.white,
                                  child: itemCount
                                      .toDoubleStringAsFixed()
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
                              onPressed: () => setState(() => itemCount += 0.1))
                        ],
                      ),
                    ).cornerRadius(25).py(8),
                    sh(10),
                  ]).py(20),
                ],
              )).cornerRadius(5).p16(),
    );
  }
}
