import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../widgets/all_widgets.dart';
import '../feeds.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  State<Weight> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<Weight> {
  String appBarTitle = 'Weight';
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
            appBar: myAppBar(context, 'Weight'),
            floatingActionButton: myfloatingButton(context, 2, appBarTitle),
            body: const ViewAddRecord(),
          )
        : const Feeds();
  }
}
