import 'package:flutter/material.dart';

ButtonStyle myButtonStyle() {
  return ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
    shape: MaterialStateProperty.all(
      const StadiumBorder(),
    ),
  );
}
