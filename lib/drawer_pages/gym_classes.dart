// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/shimmer_widget.dart';

class GymClasses extends StatefulWidget {
  const GymClasses({Key? key}) : super(key: key);

  @override
  State<GymClasses> createState() => _GymClassesState();
}

class _GymClassesState extends State<GymClasses> {
   bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }
  
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
        title: 'Gym Classes'.text.xl.black.bold.make(),
      ),
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
            height: 400,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return buildChatsShimmer();
                }).pSymmetric(h: 16),
          ),
        ],
      ),
    );
  }

  Widget buildChatsShimmer() {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const ShimmerWidget.circular(
                height: 55,
                width: 55,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(
                        height: 10,
                        width: screenWidth * 60,
                      ).cornerRadius(5),
                      ShimmerWidget.rectangular(
                        height: 8,
                        width: screenWidth * 55,
                      ).cornerRadius(5),
                    ],
                  ).pSymmetric(h: 16),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 8,
                    width: screenWidth * 70,
                  ).cornerRadius(5),
                  const ShimmerWidget.rectangular(
                    height: 8,
                  ).cornerRadius(5),
                  ShimmerWidget.rectangular(
                    height: 8,
                    width: screenWidth * 80,
                  ).cornerRadius(5),
                ],
              ))
        ],
      ).p12(),
    ).pOnly(bottom: 4).cornerRadius(5);
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
