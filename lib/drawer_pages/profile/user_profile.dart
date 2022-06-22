// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, duplicate_ignore, use_build_context_synchronously, library_private_types_in_public_api

import 'package:evolution_fitness/drawer_pages/dashboard/linear_progressbars.dart';
import 'package:evolution_fitness/drawer_pages/profile/edit_user_profile.dart';
import 'package:evolution_fitness/main.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: " Edit Profile".text.xl.bold.black.make(),
        // backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterLogo(
                    size: 80,
                  ),
                  sh(10),
                  "Sachin Solanki".text.headline3(context).bold.make(),
                  ElevatedButton(
                          onPressed: () {
                            navigatorKey.currentState!.push(
                              MaterialPageRoute(
                                builder: (context) => EditUserProfile(),
                              ),
                            );
                          },
                          style: myButtonStyle(),
                          child:
                              "Edit Information".text.bodyText1(context).make())
                      .pSymmetric(v: 5),
                  sh(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          "57.00".text.blue500.bodyText2(context).bold.make(),
                          "lbs".text.make()
                        ],
                      ),
                      Column(
                        children: [
                          "5' 25\"".text.blue500.bodyText2(context).bold.make(),
                          "ft".text.make(),
                        ],
                      ),
                      Column(
                        children: [
                          "5.54".text.blue500.bodyText2(context).bold.make(),
                          "Bmi".text.make()
                        ],
                      ),
                    ],
                  )
                ],
              ).p16(),
            ).cornerRadius(8).wFull(context),
            sh(30),
            ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: choices.length,
              itemBuilder: (context, index) =>
                  SelectCol(choice: choices[index]),
            )
          ],
        ).p16(),
      ),
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
      title: 'Allergies',
      image: Image.network(
          'https://cdn.pixabay.com/photo/2015/10/18/19/12/wheat-995055_960_720.png')),
  Choice(
      title: 'Medical Conditions',
      image: Image.network(
          'https://cdn4.iconfinder.com/data/icons/basic-ui-elements-27/512/1033_plus_sign_hospital_medical-512.png')),
  Choice(
      title: 'Medications',
      image: Image.network(
          'https://cdn-icons-png.flaticon.com/512/1529/1529570.png'))
];

class SelectCol extends StatefulWidget {
  const SelectCol({Key? key, required this.choice}) : super(key: key);
  final Choice choice;
  @override
  State<SelectCol> createState() => _SelectColState();
}

class _SelectColState extends State<SelectCol> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: EdgeInsets.all(8),
      leading: Container(
              decoration:
                  BoxDecoration(border: Border(right: BorderSide(width: 1))),
              child: widget.choice.image
                  .circle(backgroundColor: Colors.transparent, radius: 50)
                  .p4())
          .wh(70, 60),
      title: widget.choice.title.text.headline6(context).make(),
      subtitle: "ok".text.make(),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.add_circle_outlined),
      ),
    ).pOnly(bottom: 10);
  }
}
