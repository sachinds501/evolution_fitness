// ignore_for_file: unused_local_variable, recursive_getters

import 'package:flutter/material.dart';

class Constants {
  static BuildContext? context;

  final screenHeight = MediaQuery.of(context!).size.height;
  final screenWidth = MediaQuery.of(context!).size.width;
  final Color canvasColor = Theme.of(context!).canvasColor;
}
