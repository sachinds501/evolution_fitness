// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, duplicate_ignore, use_build_context_synchronously, library_private_types_in_public_api

import 'package:evolution_fitness/drawer_pages/profile/edit_user_profile.dart';
import 'package:evolution_fitness/main.dart';
import 'package:evolution_fitness/widgets/elevated_button.dart';
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
                children: [
                  FlutterLogo(
                    size: 60,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        navigatorKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (context) => EditUserProfile(),
                          ),
                        );
                      },
                      style: myButtonStyle(),
                      child: "Edit Information".text.bodyText1(context).make()),
                  SizedBox(
                    height: 30,
                  ),
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
            ).h(250).wFull(context)
          ],
        ).p16(),
      ),
    );
  }
}
