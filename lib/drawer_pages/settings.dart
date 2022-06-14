// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: 'Settings'.text.xl.black.bold.make(),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SelectTile(choice: choices[index]);
          }),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final Image icon;
}

List<Choice> choices = <Choice>[
  Choice(title: 'My Goals', icon: Image.asset('assets/images/broccoli-2.png')),
  Choice(title: 'Change Password', icon: Image.asset('assets/images/eggs.png')),
  Choice(title: 'Change Unit', icon: Image.asset('assets/images/cheese.jpg')),
  Choice(
      title: 'Terms & Conditions',
      icon: Image.asset('assets/images/cheese.jpg')),
  Choice(title: 'About Us', icon: Image.asset('assets/images/cheese.jpg')),
  Choice(title: 'Help', icon: Image.asset('assets/images/cheese.jpg')),
];

class SelectTile extends StatefulWidget {
  const SelectTile({Key? key, required this.choice}) : super(key: key);
  final Choice choice;
  @override
  State<SelectTile> createState() => _SelectTileState();
}

class _SelectTileState extends State<SelectTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: const Icon(Icons.lock),
      shape: const Border(bottom: BorderSide(width: 1)),
      title: widget.choice.title.text.make(),
    );
  }
}
