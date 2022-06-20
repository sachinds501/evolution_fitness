import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

ButtonStyle myButtonStyle() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
    shape: MaterialStateProperty.all(
      const StadiumBorder(),
    ),
  );
}

Widget myfloatingButton(BuildContext context) {
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
          onTap: () => {}),
      SpeedDialChild(
          child: const Icon(Icons.food_bank),
          backgroundColor: Colors.orangeAccent,
          label: 'Diet',
          // labelStyle: TextTheme(fontSize: 18.0),
          onTap: () {}),
    ],
  );
}
