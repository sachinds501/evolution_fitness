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
      appBar: myAppBar(context, 'Water'),
      floatingActionButton: myfloatingButton(context, 1, appBarTitle),
      body: _isLoading
          ? const ViewAddRecord()
          : SizedBox(
              height: 500,
              child:
                  Center(child: " Get Amazing Food here".text.bold.xl3.make()),
            ),
    );
  }
}
