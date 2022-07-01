import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:evolution_fitness/drawer_pages/gym_exercise.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';

class ExerciseRoutine extends StatefulWidget {
  const ExerciseRoutine({Key? key}) : super(key: key);

  @override
  State<ExerciseRoutine> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<ExerciseRoutine> {
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
            appBar: myAppBar(context, 'Exercise'),
            floatingActionButton: myfloatingButton(context, 2, 'Exercise'),
            body: const ViewAddRecord())
        : const GymExercise();
  }
}
