// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, duplicate_ignore, use_build_context_synchronously, library_private_types_in_public_api

import 'package:evolution_fitness/drawer_pages/profile/add_alergies_medications_medical_conditions.dart';
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
      appBar: myAppBar(context, "View Profile"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                              SizeTransition5(EditUserProfile()),
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
                  SelectCol(choice: choices[index], index: index),
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
  const SelectCol({Key? key, required this.choice, required this.index})
      : super(key: key);
  final Choice choice;
  final int index;
  @override
  State<SelectCol> createState() => _SelectColState();
}

class _SelectColState extends State<SelectCol> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          widget.choice.image
              .circle(backgroundColor: Colors.transparent, radius: 50)
              .p8(),
          Container(
            color: Colors.grey,
          ).wh(1, 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.choice.title.text
                    .bodyText2(context)
                    .overflow(TextOverflow.ellipsis)
                    .make(),
                sh(10),
                Wrap(
                  children: [
                    ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                            child: "ok".text.size(10).make())
                        .h(25)
                        .pSymmetric(v: 5),
                  ],
                ),
              ],
            ).pSymmetric(h: 10),
          ),
          IconButton(
            onPressed: () {
              switch (widget.index) {
                case 0:
                  Navigator.of(context).push(
                    SizeTransition5(Allergies()),
                  );
                  break;
                case 1:
                  Navigator.of(context).push(
                    SizeTransition5(MedicalConditions()),
                  );
                  break;
                case 2:
                  Navigator.of(context).push(
                    SizeTransition5(Medications()),
                  );
                  break;
                default:
              }
            },
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
          ).wh(50, 50),
        ],
      ).p12(),
    ).pOnly(bottom: 10);
  }
}
