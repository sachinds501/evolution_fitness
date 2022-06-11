// ignore_for_file: prefer_const_constructors

import 'package:evolution_fitness/drawer_pages/dashboard.dart';
import 'package:evolution_fitness/drawer_pages/membership.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 80,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Center(
                  child: ListTile(
                    onTap: () {
                      // Navigator.pushNamed(context, MyRoutes.viewprofileroute);
                    },
                    leading: CircleAvatar(
                      maxRadius: 28,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    title: 'Payel Patel'.text.size(10).extraBold.make(),
                    subtitle: 'payalbchaudhari0902@gmail.com'
                        .text
                        .bold
                        .caption(context)
                        .make(),
                  ),
                ),
              ),
            ),
            "EvolutionFitness Member".text.bold.make(),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.square,
                color: Colors.black,
              ),
              title: 'DashBoard'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.card_membership_outlined,
                color: Colors.black,
              ),
              title: 'Membership'.text.make(),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MembershipPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.play_circle_outline_outlined,
                color: Colors.black,
              ),
              title: 'Videos'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.calendar_month_outlined,
                color: Colors.black,
              ),
              title: 'Appoitment'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.photo_library_outlined,
                color: Colors.black,
              ),
              title: 'Photo Tracking'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.chat_bubble_outline_outlined,
                color: Colors.black,
              ),
              title: 'Chat'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.sports_gymnastics_outlined,
                color: Colors.black,
              ),
              title: 'Gym Exercise'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.sports_cricket_outlined,
                color: Colors.black,
              ),
              title: 'Gym Classes'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.analytics_outlined,
                color: Colors.black,
              ),
              title: 'User Progress'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.question_mark_outlined,
                color: Colors.black,
              ),
              title: 'Bots'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.book_outlined,
                color: Colors.black,
              ),
              title: 'Diary'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
              title: 'Settings'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.person_outline,
                color: Colors.black,
              ),
              title: 'My Experts'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: const FaIcon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: 'Logout'.text.make(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
