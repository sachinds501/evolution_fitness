import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar appbar(String title) {
    return AppBar(
        title: title.text.xl.black.bold.make(),
        iconTheme: const IconThemeData(),
        actions: [
          IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bell_fill))
              .pOnly(right: 5),
              
        ]);
  }