import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FoodRoutine extends StatefulWidget {
  const FoodRoutine({Key? key}) : super(key: key);

  @override
  State<FoodRoutine> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<FoodRoutine> {
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
      appBar: AppBar(
        title: 'Diet'.text.xl.black.bold.make(),
      ),
      floatingActionButton: myfloatingButton(context),
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
