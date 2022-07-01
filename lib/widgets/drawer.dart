// ignore_for_file: prefer_const_constructors
import 'package:evolution_fitness/drawer_pages/appointment/appointment.dart';
import 'package:evolution_fitness/drawer_pages/bots.dart';
import 'package:evolution_fitness/drawer_pages/chats.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/dashboard.dart';
import 'package:evolution_fitness/drawer_pages/diary.dart';
import 'package:evolution_fitness/drawer_pages/experts.dart';
import 'package:evolution_fitness/drawer_pages/gym_classes.dart';
import 'package:evolution_fitness/drawer_pages/gym_exercise.dart';
import 'package:evolution_fitness/drawer_pages/membership.dart';
import 'package:evolution_fitness/drawer_pages/photo_tracking/photo_tracking.dart';
import 'package:evolution_fitness/drawer_pages/profile/user_profile.dart';
import 'package:evolution_fitness/drawer_pages/settings/settings.dart';
import 'package:evolution_fitness/drawer_pages/videos/videos.dart';
import 'package:evolution_fitness/pages/splashscreen.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../drawer_pages/user_progress.dart';
import '../utils/user_simple_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String fname = '';
  String lname = '';

  @override
  void initState() {
    super.initState();

    fname = UserSimplePreferences.getFname() ?? ' ';
    lname = UserSimplePreferences.getLname() ?? ' ';
  }

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
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          SizeTransition5(
                            UserProfile(),
                          ));
                      // after the SecondScreen result comes back update the Text widget with it
                      setState(() {
                        result == null
                            ? null
                            : {
                                fname = result[0],
                                lname = result[1],
                              };
                      });
                    },
                    leading: CircleAvatar(
                      maxRadius: 28,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: '$fname $lname'.text.bodyText1(context).make(),
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
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: draweritems.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    icons[index],
                    color: Colors.black,
                  ),
                  title: draweritems[index].text.bodyText2(context).make(),
                  onTap: () {
                    Navigator.of(context).push(SizeTransition5(pages[index]));
                  },
                ).h(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> draweritems = <String>[
  'DashBoard',
  'Membership',
  'Video',
  'Appointment',
  'Photo Tracking',
  'Chat',
  'Gym Exercise',
  'Gym Classes',
  'User Progress',
  'Bots',
  'Diary',
  'Settings',
  'My Experts',
  'Logout'
];

List<IconData> icons = <IconData>[
  Icons.menu,
  Icons.card_membership_outlined,
  Icons.play_circle_outline_outlined,
  Icons.calendar_month_outlined,
  Icons.photo_library_outlined,
  Icons.chat_bubble_outline_outlined,
  Icons.sports_gymnastics_outlined,
  Icons.sports_cricket_outlined,
  Icons.analytics_outlined,
  Icons.question_mark_outlined,
  Icons.book_outlined,
  Icons.settings_outlined,
  Icons.person_outline,
  Icons.logout_outlined,
];

List<Widget> pages = <Widget>[
  Dashboard(),
  MembershipPage(),
  Videos(),
  Appointment(),
  PhotoTracking(),
  ChatsPage(),
  GymExercise(),
  GymClasses(),
  UserProgress(),
  Bots(),
  Diary(),
  Settings(),
  Experts(),
  AfterSplash(),
];
