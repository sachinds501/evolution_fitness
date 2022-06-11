import 'package:evolution_fitness/drawer_pages/dashboard.dart';
import 'package:evolution_fitness/drawer_pages/membership.dart';
import 'package:evolution_fitness/pages/splashscreen.dart';
import 'package:evolution_fitness/utils/routes.dart';
import 'package:evolution_fitness/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evolution Fitness',
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.membershipRoute,
      routes: {
        MyRoutes.dashboardRoute: (context) => const Dashboard(),
        MyRoutes.splashscreenRoute: (context) => const AfterSplash(),
        MyRoutes.membershipRoute: (context) => const MembershipPage(),
      },
    );
  }
}
