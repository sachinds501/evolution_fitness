// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';

class Time {
  const Time({
    required this.time,
  });
  final String time;
}

const List<Time> times = <Time>[
  Time(time: '11:00 AM'),
  Time(time: '11:30 AM'),
  Time(time: '12:00 AM'),
  Time(time: '1:00 PM'),
  Time(time: '4:00 PM'),
  Time(time: '5:00 PM'),
  Time(time: '6:00 PM'),
  Time(time: '7:00 PM'),
  Time(time: '8:00 PM'),
  Time(time: '7:45 PM'),
];

class BookAppointment extends StatefulWidget {
  const BookAppointment({
    Key? key,
    
  }) : super(key: key);


  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  bool _readOnly = false;
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _selectedIndex;
  bool _selectCheck = false;
  var alertDialogMessage = 'evolutionankleshwar(Admin)';
  bool ok = false;
  // final TextEditingController _selectExpertController = TextEditingController();

  @override
  void initState() {
    _readOnly = false;
    _selectCheck = false;
    alertDialogMessage = 'evolutionankleshwar(Admin)';
    ok = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: 'Book Appointment'.text.headline3(context).make(),
        actions: [const Icon(Icons.check).pOnly(right: 10)],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey[100]!),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ok == true
                              ? alertDialogMessage.text
                                  .bodyText2(context)
                                  .color(Colors.lightBlue)
                                  .make()
                              : 'Select Your Expert/Coach'
                                  .text
                                  .bodyText2(context)
                                  .gray500
                                  .make(),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ).pSymmetric(h: 12),
                    ).h(45),
                    onTap: () {
                      showDialogBox(context);
                      setState(() {});
                    },
                  ).cornerRadius(5),
                  const PickDate(),
                  tff('Type', '', _typeController),
                  tff('Description', '', _descriptionController),
                ],
              ).h(230),
              Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    'Select Time'
                        .text
                        .color(Colors.lightBlue)
                        .fontWeight(FontWeight.w500)
                        .make(),
                    if (ok == true)
                      Wrap(
                        children: [
                          for (int i = 0; i < times.length; i++)
                            TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedIndex = i;
                                      });
                                    },
                                    child: _selectedIndex == i
                                        ? times[i]
                                            .time
                                            .text
                                            .green500
                                            .headline6(context)
                                            .make()
                                        : times[i]
                                            .time
                                            .text
                                            .black
                                            .headline6(context)
                                            .make())
                                .h(30)
                        ],
                      ).pSymmetric(v: 12),
                    Wrap(spacing: 10, children: [
                      VxTwoRow(
                              left:
                                  const Icon(Icons.square, color: Colors.black),
                              right: 'Available'
                                  .text
                                  .black
                                  .headline6(context)
                                  .make())
                          .w(100),
                      VxTwoRow(
                              left:
                                  const Icon(Icons.square, color: Colors.green),
                              right: 'Your selection'
                                  .text
                                  .headline6(context)
                                  .green500
                                  .make())
                          .w(140),
                      VxTwoRow(
                              left:
                                  Icon(Icons.square, color: Colors.grey[300]!),
                              right: 'Unavailable'
                                  .text
                                  .headline6(context)
                                  .gray300
                                  .make())
                          .w(120)
                    ]),
                  ],
                ).p12(),
              ).wFull(context)
            ],
          ).p16().wFull(context),
        ),
      ).cornerRadius(8).wFull(context).p16(),
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

  Widget tff(fieldValue, suffix, controller) {
    return TextFormField(
      controller: controller,
      readOnly: _readOnly == true ? true : false,
      cursorColor: Theme.of(context).colorScheme.secondary,
      cursorHeight: 30,
      cursorWidth: 3,
      style: const TextStyle(fontSize: 14),
      decoration: myInputDecoration(fieldValue, suffix),
      onFieldSubmitted: (value) {
        fieldValue = value;
      },
      onSaved: (value) {
        controller.text = value;
        fieldValue = value;
        setState(
          () {
            _readOnly = false;
          },
        );
      },
    ).h(45);
  }
}

// class SelectTime extends StatefulWidget {
//   SelectTime(
//       {Key? key,
//       required this.chooseTime,
//       required this.index,
//       required this.selectedIndex})
//       : super(key: key);
//   final Time chooseTime;
//   final int index;
//   int? selectedIndex;
//   @override
//   State<SelectTime> createState() => _SelectTimeState();
// }

// class _SelectTimeState extends State<SelectTime> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int? selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView.builder(
//         shrinkWrap: true,
//         physics: const AlwaysScrollableScrollPhysics(),
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Item: $index'),
//             tileColor: selectedIndex == index ? Colors.blue : null,
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//           );
//         },
//       ),
//     );
//   }
// }
