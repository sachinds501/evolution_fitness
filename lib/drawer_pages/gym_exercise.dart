// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/shimmer_widget.dart';

class GymExercise extends StatefulWidget {
  const GymExercise({Key? key}) : super(key: key);

  @override
  State<GymExercise> createState() => _GymExerciseState();
}

class _GymExerciseState extends State<GymExercise> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return DateFormat('MMM dd yyyy').format(DateTime.now());
    } else {
      return DateFormat('MMM dd yyyy').format(date!);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: 'Gym Exercise'.text.xl.black.xl.bold.make(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Card(
            elevation: 0,
            color: Colors.white,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getText().text.black.make(),
                    const Icon(Icons.calendar_month, color: Colors.blueGrey),
                  ],
                ).pSymmetric(h: 12),
              ).p16(),
              onTap: () => pickDate(context),
            ),
          ).cornerRadius(5).p16().h(110),
          SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return buildChatsShimmer();
                  })).pSymmetric(h: 16),
        ],
      ),
    );
  }

  Widget buildChatsShimmer() {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 5,
            width: screenWidth * 80,
          ).cornerRadius(5),
          const ShimmerWidget.rectangular(
            height: 5,
          ).wFull(context).cornerRadius(5),
          const ShimmerWidget.rectangular(
            height: 5,
          ).w48(context).cornerRadius(5),
        ],
      ).p4(),
    ).pOnly(bottom: 4);
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blueAccent, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.green, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
