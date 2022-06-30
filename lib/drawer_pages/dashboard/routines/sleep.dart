import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SleepRoutine extends StatefulWidget {
  const SleepRoutine({Key? key}) : super(key: key);

  @override
  State<SleepRoutine> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<SleepRoutine> {
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
      appBar: myAppBar(context, 'Sleep'),
      floatingActionButton: myfloatingButton(context, 1, 'Sleep'),
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
