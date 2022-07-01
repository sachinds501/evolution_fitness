import 'dart:async';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Help".text.headline3(context).make(),
      ),
      body: Container(
        color: Colors.white,
        child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SizeTransition5(const AddNewTicket()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: "ADD NEW TICKET".text.xl.white.make())
            .h(40)
            .p64(),
      ).cornerRadius(5).wFull(context).p16(),
    );
  }
}

class AddNewTicket extends StatefulWidget {
  const AddNewTicket({Key? key}) : super(key: key);

  @override
  State<AddNewTicket> createState() => _AddNewTicketState();
}

class _AddNewTicketState extends State<AddNewTicket> {
  String? url;
  bool readOnly = false;
  bool _selectCheck = false;
  bool ok = false;

  final _formKey = GlobalKey<FormState>();

  var alertDialogMessage = 'select issue';
  final String _phone = '';
  final String _email = '';
  final String _title = '';
  final String _description = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        'Contact us',
        action: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check))
              .pOnly(right: 10)
        ],
      ),

      // actions: [const Icon(Icons.check).pOnly(right: 10)],
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                selectIssue(context).cornerRadius(5),
                const HeightBox(15),
                'Tell us more'.text.xl.blue500.make(),
                const HeightBox(10),
                email(),
                const HeightBox(10),
                phoneNo(),
                const HeightBox(10),
                title(),
                const HeightBox(10),
                description(),
                const HeightBox(10),
              ],
            ).p16(),
          ),
        ),
      ).cornerRadius(5).p16(),
    );
  }

  InkWell selectIssue(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[100]!),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ok == true
                ? alertDialogMessage.text
                    .bodyText2(context)
                    .color(Colors.lightBlue)
                    .make()
                : 'Select issue'.text.bodyText2(context).gray500.make(),
            const Icon(Icons.arrow_drop_down),
          ],
        ).pSymmetric(h: 12),
      ).h(40),
      onTap: () {
        showDialogBox(context);
        setState(() {});
      },
    );
  }

  Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            actions: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Checkbox(
                    value: _selectCheck,
                    onChanged: (value) {
                      setState(() {
                        _selectCheck = value!;
                      });
                    }),
                shape: const Border.symmetric(horizontal: BorderSide(width: 1)),
                title: alertDialogMessage.text.headline6(context).make(),
              ),
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _selectCheck = false;
                          ok = false;
                          Navigator.pop(context);
                        });
                      },
                      child: 'Cancel'.text.headline3(context).blue500.make()),
                  TextButton(
                      onPressed: () {
                        if (_selectCheck == true) {
                          ok = true;
                        } else {
                          ok = false;
                        }
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                      child: 'Ok'.text.headline3(context).blue500.make()),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget phoneNo() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
          });
        },
        title: 'Contact Number*'.text.bodyText1(context).make(),
        subtitle: tff('Add phone no.', _phone, context));
  }

  Widget email() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
          });
        },
        title: 'Email*'.text.bodyText1(context).make(),
        subtitle: tff(_email, email, context));
  }

  Widget title() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
        });
      },
      title: 'Title*'.text.bodyText1(context).make(),
      subtitle: tff('Title', _title, context),
    );
  }

  Widget description() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
        });
      },
      title: 'Description*'.text.bodyText1(context).make(),
      subtitle: tff('Description', _description, context,
              maxlines: null, expands: true)
          .h(150),
    );
  }
}
