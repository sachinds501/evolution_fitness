// ignore_for_file: use_key_in_widget_constructors

import 'package:evolution_fitness/drawer_pages/settings/change_password.dart';
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
          itemCount: choices.length,
          itemBuilder: (context, index) {
            return SelectTile(
              choice: choices[index],
              index: index,
            );
          }),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.image});
  final String title;
  final Image image;
}

List<Choice> choices = <Choice>[
  Choice(
      title: 'My Goals',
      image: Image.network(
          'https://thumbs.dreamstime.com/b/goal-icon-vector-sign-symbol-isolated-white-background-goal-logo-concept-goal-icon-vector-isolated-white-background-134071818.jpg')),
  Choice(
      title: 'Change Password',
      image: Image.network(
          'https://cdn.pixabay.com/photo/2017/06/22/10/04/lock-2430207_1280.png')),
  Choice(
      title: 'Change Unit',
      image: Image.network(
          'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png')),
  Choice(
      title: 'Terms & Conditions',
      image: Image.network(
          'https://w7.pngwing.com/pngs/832/130/png-transparent-computer-icons-management-task-clipboard-others-miscellaneous-blue-logo.png')),
  Choice(
      title: 'About Us',
      image: Image.network(
          'https://img.freepik.com/free-icon/info-logo-circle_318-947.jpg?w=2000')),
  Choice(
      title: 'Help',
      image: Image.network(
          'https://www.kindpng.com/picc/m/747-7470356_call-icon-red-png-clipart-png-download-iphone.png')),
];

class SelectTile extends StatefulWidget {
  const SelectTile({Key? key, required this.choice, required this.index})
      : super(key: key);
  final Choice choice;
  final int index;
  @override
  State<SelectTile> createState() => _SelectTileState();
}

class _SelectTileState extends State<SelectTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        switch (widget.index) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          case 3:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          case 4:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          case 5:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          case 6:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Password(),
            ));
            break;
          default:
        }
      },
      tileColor: Colors.white,
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.transparent,
        child: widget.choice.image,
      ),
      shape: const Border(bottom: BorderSide(width: 1)),
      title: widget.choice.title.text.make(),
    );
  }
}
