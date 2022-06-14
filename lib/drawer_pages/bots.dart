// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Bot extends StatefulWidget {
  const Bot({Key? key}) : super(key: key);

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: 'Bots'.text.xl.black.bold.make(),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 50),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Type here...',
                  ),
                ).w56(context),
              ),
              InkWell(
                child: Container(
                    width: 80,
                    height: 50,
                    color: Colors.blue,
                    child: "SEND".text.makeCentered()),
                onTap: () {},
              )
            ],
          ),
        ),
      ]),
    );
  }
}
