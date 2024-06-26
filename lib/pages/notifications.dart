import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Notification'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, value) => ListTile(
          title: "Your appointment scheduled"
              .text
              .overflow(TextOverflow.ellipsis)
              .bodyText2(context)
              .make(),
          subtitle: Text(DateFormat('dd MMM yyy').format(DateTime.now())),
          tileColor: Colors.white,
          leading: const Icon(
            CupertinoIcons.bell_circle,
            size: 40,
          ),
          shape: const Border(bottom: BorderSide(width: 1)),
          trailing: Text(
            DateFormat.jm().format(DateTime.now()),
          ),
        ).h(80),
      ),
    );
  }
}
