// ignore_for_file: use_key_in_widget_constructors
import 'package:evolution_fitness/drawer_pages/settings/change_password.dart';
import 'package:evolution_fitness/drawer_pages/settings/change_unit.dart';
import 'package:evolution_fitness/drawer_pages/settings/goals.dart';
import 'package:evolution_fitness/drawer_pages/settings/help.dart';
import 'package:evolution_fitness/drawer_pages/settings/terms_and_conditions.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
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
        title: 'Settings'.text.headline3(context).make(),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: choices.length,
          itemBuilder: (context, index) {
            return SelectTile(
              choice: choices[index],
            );
          }),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.image, required this.page});
  final String title;
  final String image;
  final Widget page;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'My Goals', image: 'assets/images/goals.jpg', page: Goals()),
  Choice(
      title: 'Change Password',
      image: 'assets/images/password.png',
      page: Password()),
  Choice(
      title: 'Change Unit',
      image: 'assets/images/flag.webp',
      page: ChangeUnit()),
  Choice(
      title: 'Terms & Conditions',
      image: 'assets/images/tandc.png',
      page: TermsAndConditions()),
  Choice(title: 'About Us', image: 'assets/images/about.webp', page: AboutUs()),
  Choice(title: 'Help', image: 'assets/images/help.png', page: Help()),
];

class SelectTile extends StatefulWidget {
  const SelectTile({Key? key, required this.choice});
  final Choice choice;
  @override
  State<SelectTile> createState() => _SelectTileState();
}

class _SelectTileState extends State<SelectTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(SizeTransition5(widget.choice.page));
      },
      tileColor: Colors.white,
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.transparent,
        child:
            Image.asset(widget.choice.image, filterQuality: FilterQuality.low),
      ),
      shape: const Border(bottom: BorderSide(width: 1)),
      title: widget.choice.title.text.bodyText2(context).make(),
    );
  }
}
