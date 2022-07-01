import 'package:evolution_fitness/drawer_pages/dashboard/routines/view_add_record_shimmer.dart';
import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SleepRoutine extends StatefulWidget {
  const SleepRoutine({Key? key}) : super(key: key);

  @override
  State<SleepRoutine> createState() => _FoodRoutineState();
}

class _FoodRoutineState extends State<SleepRoutine> {
  String? _btn3SelectedVal;
  String? _btn4SelectedVal;

  static const minutes = <String>[
    '00',
    '15',
    '30',
    '45',
  ];

  final List<DropdownMenuItem<String>> dropdown1 = minutes
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  static const hours = <String>[
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
  ];

  final List<DropdownMenuItem<String>> dropdown2 = hours
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  bool _isLoading = false;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: myAppBar(
        context,
        'Sleep',
        action: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
          ).pOnly(right: 10)
        ],
      ),
      floatingActionButton: myfloatingButton(context, 1, 'Sleep'),
      body: _isLoading
          ? const ViewAddRecord()
          : Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Set your Goal".text.white.xl3.makeCentered(),
                        "Set your target to stay active and healthy"
                            .text
                            .white
                            .headline6(context)
                            .makeCentered()
                      ],
                    ).pSymmetric(v: 40),
                  ),
                  sh(20),
                  ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title:
                        'Sleep'.text.bodyText1(context).red500.makeCentered(),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.blueGrey[100]!,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                dropdownColor: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                value: _btn3SelectedVal,
                                hint: 'hours'.text.headline6(context).make(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() => _btn3SelectedVal = newValue);
                                  }
                                },
                                items: dropdown2,
                              ).pSymmetric(h: 12),
                            ),
                          ).h(40),
                        ),
                        sw(20),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.blueGrey[100]!,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                dropdownColor: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                value: _btn4SelectedVal,
                                hint: 'minutes'.text.headline6(context).make(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() => _btn4SelectedVal = newValue);
                                  }
                                },
                                items: dropdown1,
                              ).pSymmetric(h: 12),
                            ),
                          ).h(40),
                        ),
                      ],
                    ).pOnly(top: 10),
                  ),
                  sh(20)
                ],
              ),
            ).cornerRadius(5).p16(),
    );
  }
}
