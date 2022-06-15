// ignore_for_file: use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/shimmer_widget.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  bool _isLoading = false;
  DateTime? date;
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: "Appointment".text.xl.black.bold.make(),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VxTwoRow(
                  left: const Icon(
                    Icons.circle_rounded,
                    size: 10,
                    color: Colors.red,
                  ),
                  right: "Current Date".text.make(),
                ),
                VxTwoRow(
                    left: const Icon(
                      Icons.circle_rounded,
                      size: 10,
                      color: Colors.blue,
                    ),
                    right: "Appointment Date".text.make())
              ],
            ),
          ).p12(),
          _isLoading
              ? buildAppointmentShimmer().pOnly()
              : Container(
                  color: Colors.white,
                  child: TableCalendar(
                    calendarController: _calendarController,
                    calendarStyle: CalendarStyle(
                        selectedColor: Colors.lightBlue[300],
                        todayColor: Colors.red),
                    headerStyle: HeaderStyle(
                        decoration:
                            BoxDecoration(color: Colors.lightBlue[300])),
                  ),
                ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
            child: 'Book Appointment'.toUpperCase().text.bold.makeCentered(),
          ).wFull(context).h(50),
        ],
      ),
    );
  }

  Widget buildAppointmentShimmer() {
    final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return SizedBox(
      // color: Colors.white,
      height: screenHeight * 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: screenHeight * 30,
              color: Colors.white,
              child: ShimmerWidget.rectangular(height: screenHeight * 25).p8()),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: screenHeight * 8,
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(
                    height: 5,
                    width: screenWidth * 80,
                  ).cornerRadius(15),
                  const ShimmerWidget.rectangular(
                    height: 5,
                  ).cornerRadius(15),
                  ShimmerWidget.rectangular(
                    height: 5,
                    width: screenWidth * 50,
                  ).cornerRadius(15),
                ]).p4(),
          ),
        ],
      ),
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
