import 'package:evolution_fitness/drawer_pages/dashboard/feeds.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';

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
    return _isLoading
        ? Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            appBar: myAppBar(context, 'Diet'),
            floatingActionButton: myfloatingButton(context, 2, 'Diet'),
            body: const ViewAddRecord(),
          )
        : const Feeds();
  }
}
