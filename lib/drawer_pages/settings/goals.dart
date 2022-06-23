import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
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
  ];

  final List<DropdownMenuItem<String>> dropdown2 = hours
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        'Goal',
        action: [const Icon(Icons.check).pOnly(right: 10)],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title:
                        'Steps'.text.bodyText1(context).blue500.makeCentered(),
                    subtitle: TextFormField(
                      // controller: _confirmPass,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                      decoration: myUnderlineInputDec(),
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      cursorHeight: 30,
                      cursorWidth: 3,
                      onFieldSubmitted: (value) {},
                      onSaved: (value) {
                        setState(() {});
                      },
                    ).h(40),
                  ),
                  sh(20),
                  ListTile(
                    onTap: () {
                      setState(() {});
                    },
                    title:
                        'Sleep'.text.bodyText1(context).blue500.makeCentered(),
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
                ],
              ),
            ),
          ],
        ),
      ).cornerRadius(5).p16().hHalf(context),
    );
  }
}
