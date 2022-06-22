// ignore_for_file: prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/Bots.dart';
import 'package:evolution_fitness/drawer_pages/appointment/appointment.dart';
import 'package:evolution_fitness/drawer_pages/chats.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/dashboard.dart';
import 'package:evolution_fitness/drawer_pages/diary.dart';
import 'package:evolution_fitness/drawer_pages/experts.dart';
import 'package:evolution_fitness/drawer_pages/gym_classes.dart';
import 'package:evolution_fitness/drawer_pages/membership.dart';
import 'package:evolution_fitness/drawer_pages/photo_tracking.dart';
import 'package:evolution_fitness/drawer_pages/settings/settings.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/user_progress.dart';
import 'package:evolution_fitness/drawer_pages/videos/videos.dart';
import 'package:evolution_fitness/pages/splashscreen.dart';
import 'package:evolution_fitness/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          // Important: Remove any padding from the ListView.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.userprofileRoute);
                    },
                    leading: CircleAvatar(
                      maxRadius: 28,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: 'Sachin Solanki'.text.bodyText1(context).make(),
                    subtitle:
                        'codesachin501@gmail.com'.text.caption(context).make(),
                  ),
                ),
              ),
            ),
            "  EvolutionFitness Member".text.bold.make(),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.square,
                      color: Colors.black,
                    ),
                    title: 'DashBoard'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.card_membership_outlined,
                      color: Colors.black,
                    ),
                    title: 'Membership'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MembershipPage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.play_circle_outline_outlined,
                      color: Colors.black,
                    ),
                    title: 'Videos'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Videos()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.calendar_month_outlined,
                      color: Colors.black,
                    ),
                    title: 'Appoitment'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Appointment()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.photo_library_outlined,
                      color: Colors.black,
                    ),
                    title: 'Photo Tracking'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PhotoTracking()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.chat_bubble_outline_outlined,
                      color: Colors.black,
                    ),
                    title: 'Chat'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChatsPage()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.sports_gymnastics_outlined,
                      color: Colors.black,
                    ),
                    title: 'Gym Exercise'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(MyRoutes.gymexerciseRoute);
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.sports_cricket_outlined,
                      color: Colors.black,
                    ),
                    title: 'Gym Classes'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GymClasses()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.analytics_outlined,
                      color: Colors.black,
                    ),
                    title: 'User Progress'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserProgress()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.question_mark_outlined,
                      color: Colors.black,
                    ),
                    title: 'Bots'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Bot()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.book_outlined,
                      color: Colors.black,
                    ),
                    title: 'Diary'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Diary()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.settings_outlined,
                      color: Colors.black,
                    ),
                    title: 'Settings'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Settings()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.person_outline,
                      color: Colors.black,
                    ),
                    title: 'My Experts'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Experts()));
                    },
                  ),
                  ListTile(
                    leading: const FaIcon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                    title: 'Logout'.text.bodyText2(context).make(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AfterSplash()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
