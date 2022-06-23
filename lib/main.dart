// ignore_for_file: use_key_in_widget_constructors, unused_field

import 'package:evolution_fitness/drawer_pages/appointment/book_appointment.dart';
import 'package:evolution_fitness/drawer_pages/bots.dart';
import 'package:evolution_fitness/drawer_pages/chats.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/dashboard.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/feeds.dart';
import 'package:evolution_fitness/drawer_pages/diary.dart';
import 'package:evolution_fitness/drawer_pages/experts.dart';
import 'package:evolution_fitness/drawer_pages/gym_classes.dart';
import 'package:evolution_fitness/drawer_pages/gym_exercise.dart';
import 'package:evolution_fitness/drawer_pages/membership.dart';
import 'package:evolution_fitness/drawer_pages/photo_tracking.dart';
import 'package:evolution_fitness/drawer_pages/dashboard/user_progress.dart';
import 'package:evolution_fitness/drawer_pages/profile/user_profile.dart';
import 'package:evolution_fitness/drawer_pages/videos/video_info.dart';
import 'package:evolution_fitness/drawer_pages/videos/videos.dart';
import 'package:evolution_fitness/pages/notifications.dart';
import 'package:evolution_fitness/pages/splashscreen.dart';
import 'package:evolution_fitness/utils/routes.dart';
import 'package:evolution_fitness/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'drawer_pages/appointment/appointment.dart';
import 'drawer_pages/dashboard/routines/view_add_record_shimmer.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evolution Fitness',
      navigatorKey: navigatorKey,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.dashboardRoute,
      routes: {
        MyRoutes.dashboardRoute: (context) => const Dashboard(),
        MyRoutes.splashscreenRoute: (context) => const AfterSplash(),
        MyRoutes.membershipRoute: (context) => const MembershipPage(),
        MyRoutes.videoRoute: (context) => const Videos(),
        MyRoutes.appointmentRoute: (context) => const Appointment(),
        MyRoutes.phototrackingRoute: (context) => const PhotoTracking(),
        MyRoutes.chatsRoute: (context) => const ChatsPage(),
        MyRoutes.gymexerciseRoute: (context) => const GymExercise(),
        MyRoutes.gymclassesRoute: (context) => const GymClasses(),
        MyRoutes.botsRoute: (context) => const Bot(),
        MyRoutes.userprogressRoute: (context) => const UserProgress(),
        MyRoutes.diaryRoute: (context) => const Diary(),
        MyRoutes.expertsRoute: (context) => const Experts(),
        MyRoutes.viewaddrecordRoute: (context) => const ViewAddRecord(),
        MyRoutes.notificationsRoute: (context) => const Notifications(),
        MyRoutes.userprofileRoute: (context) => UserProfile(),
        MyRoutes.feedsRoute: ((context) => const Feeds()),
        MyRoutes.bookappointmentRoute: ((context) => const BookAppointment()),
        MyRoutes.videoinfoRoute: ((context) => const VideoInfo()),
        
      },
    );
  }
}
