import 'package:evolution_fitness/drawer_pages/appointment/book_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

ButtonStyle myButtonStyle() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
    shape: MaterialStateProperty.all(
      const StadiumBorder(),
    ),
  );
}

Widget myfloatingButton(BuildContext context, id, appBarTitle) {
  return SpeedDial(
    animatedIcon: AnimatedIcons.add_event,
    animatedIconTheme: const IconThemeData(size: 30.0),
    // this is ignored if animatedIcon is non null
    // child: Icon(Icons.add),
    // visible: _dialVisible,

    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.redAccent,
    foregroundColor: Colors.white,
    elevation: 8.0,
    shape: const CircleBorder(),
    children: [
      SpeedDialChild(
          child: const Icon(Icons.call),
          backgroundColor: Colors.greenAccent,
          label: 'Appointment',
          // labelStyle: TextTheme(fontSize: 18.0),
          onTap: () => {
                Navigator.of(context)
                    .push(SizeTransition5(const BookAppointment()))
              }),
      if (id == 2)
        SpeedDialChild(
            child: const Icon(Icons.food_bank),
            backgroundColor: Colors.orangeAccent,
            label: appBarTitle,
            // labelStyle: TextTheme(fontSize: 18.0),
            onTap: () {}),
    ],
  );
}

/* Pick Date Widget*/
class PickDate extends StatefulWidget {
  const PickDate({Key? key}) : super(key: key);

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
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
    return InkWell(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 45),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueGrey[100]!),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getText().text.color(Colors.lightBlue).make(),
            Icon(Icons.calendar_month, color: Colors.blueGrey[100]),
          ],
        ).pSymmetric(h: 12),
      ).h(45).wFull(context),
      onTap: () => pickDate(context),
    );
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

/* Input Decoration*/
InputDecoration myInputDecoration(fieldValue, suffix) {
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
    // filled: true,
    // fillColor: Colors.grey[100],
    hintStyle: const TextStyle(fontSize: 12),
    labelStyle: const TextStyle(fontSize: 12),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[100]!),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey[100]!),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey[100]!),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    hintText: fieldValue,
    suffix: Text(
      suffix,
      style: const TextStyle(color: Colors.black),
    ),
  );
}

/* Sized Box*/
SizedBox sh(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox sw(double width) {
  return SizedBox(
    width: width,
  );
}

SizedBox swh(double width, double height) {
  return SizedBox(
    width: width,
    height: height,
  );
}

InputDecoration myUnderlineInputDec() {
  return InputDecoration(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey[100]!),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey[100]!),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey[100]!),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey[100]!),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red[100]!),
    ),
  );
}

AppBar myAppBar(BuildContext context, String title,
    {List<Widget>? action = const [], String data = ''}) {
  return AppBar(
    title: title.text.headline3(context).make(),
    actions: action,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(data),
    ),
  );
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

Widget tff(fieldValue, initialValue, setState, BuildContext context,
    {maxlines = 1, readOnly = false, expands = false, suffix = ''}) {
  return TextFormField(
    initialValue: initialValue,
    readOnly: readOnly == true ? true : false,
    cursorColor: Theme.of(context).colorScheme.secondary,
    cursorHeight: 30,
    cursorWidth: 3,
    expands: expands,
    style: const TextStyle(fontSize: 14),
    decoration: myInputDecoration(fieldValue, suffix),
    maxLines: maxlines,
    onChanged: (String name) => initialValue = name,
  ).h(40).pOnly(top: 5);
}
