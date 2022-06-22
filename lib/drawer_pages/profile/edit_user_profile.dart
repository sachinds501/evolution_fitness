// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, duplicate_ignore, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/all_widgets.dart';

class EditUserProfile extends StatefulWidget {
  EditUserProfile({Key? key}) : super(key: key);

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  String name = "";
  DateTime? date;
  bool changeButton = false;
  String? _btn3SelectedVal;
  bool? readOnly;
  final String _fname = 'Sachin';
  final String _lname = 'Solanki';
  final String _phone = '92540 24221';
  final List<bool> _tileno = [false, false, false];
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final phoneController = TextEditingController();
  final feetController = TextEditingController();
  final inchController = TextEditingController();
  final weightController = TextEditingController();

  final _formKey3 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      readOnly = false;
    });
  }

  static const gender = <String>[
    'Male',
    'Female',
    'Transgender',
  ];

  final List<DropdownMenuItem<String>> dropdown1 = gender
      .map(
        (String value) => DropdownMenuItem<String>(
          // enabled: readOnly == true ? false : true,
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String getText() {
    if (date == null) {
      return 'Enter you Date of Birth';
    } else {
      return DateFormat('dd-MM-yyyy').format(date!);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: " Edit Profile".text.xl.bold.black.make(),
        // backgroundColor: Colors.blue,
        actions: [
          readOnly == true
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      readOnly = false;
                    });
                  },
                  child: "Edit".text.red500.bold.make())
              : IconButton(
                      onPressed: () {
                        _formKey3.currentState!.save();
                        setState(() {
                          readOnly = true;
                        });
                      },
                      icon: Icon(Icons.check))
                  .pOnly(right: 12)
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey3,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                FlutterLogo(
                  size: 100,
                ).centered(),

                // "Name" form.
                const SizedBox(height: 24.0),
                firstname(),
                SizedBox(
                  height: 10,
                ),
                lastName(),
                SizedBox(
                  height: 10,
                ),
                dob(),
                SizedBox(
                  height: 10,
                ),

                phoneNo(),

                SizedBox(
                  height: 10,
                ),
                selectGender(),

                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: 'Height'.text.bodyText1(context).make(),
                      subtitle: tff(5.toString(), 'ft', feetController),
                    ).wOneThird(context),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: ''.text.bodyText1(context).make(),
                      subtitle: tff(6.toString(), 'inch', inchController),
                    ).wOneThird(context),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: 'Weight'.text.bodyText1(context).make(),
                  subtitle: tff(60.toString(), 'lbs', weightController),
                ).wOneThird(context),
              ],
            ).p16(),
          ).p16(),
        ),
      ),
    );
  }

  /* ----------------- Method Extracted bewlow--------------*/
  /* ----------------- Method Extracted bewlow--------------*/
  /* ----------------- Method Extracted bewlow--------------*/
  /* ----------------- Method Extracted bewlow--------------*/

  Widget dob() => ListTile(
        contentPadding: EdgeInsets.zero,
        enabled: readOnly == false ? true : false,
        title: 'Date of Birth*'.text.bodyText1(context).make(),
        onTap: () => pickDate(context),
        subtitle: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getText().text.size(12).black.make(),
              const Icon(Icons.calendar_month, color: Colors.blueGrey),
            ],
          ).pSymmetric(h: 12),
        ).h(40).pOnly(top: 5),
      );

  ListTile selectGender() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      enabled: readOnly == true ? false : true,
      title: 'Gender*'.text.bodyText1(context).make(),
      trailing: DropdownButton(
        style: TextStyle(fontSize: 14, color: Colors.black),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        value: _btn3SelectedVal,
        hint: 'Choose'.text.headline6(context).make(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _btn3SelectedVal = newValue);
          }
        },
        items: dropdown1,
      ).h(40),
    );
  }

  Widget phoneNo() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
            _tileno[2] = true;
          });
        },
        title: 'Contact Number*'.text.bodyText1(context).make(),
        subtitle: tff(_phone, '', phoneController));
  }

  Widget lastName() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
          _tileno[0] = true;
        });
      },
      title: 'Last Name'.text.bodyText1(context).make(),
      subtitle: tff(_lname, '', lnameController),
    );
  }

  Widget firstname() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
            _tileno[0] = true;
          });
        },
        title: 'First Name'.text.bodyText1(context).make(),
        subtitle: tff(_fname, '', fnameController));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blueAccent, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.green, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  Widget tff(fieldValue, suffix, controller) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly == true ? true : false,
      cursorColor: Theme.of(context).colorScheme.secondary,
      cursorHeight: 30,
      cursorWidth: 3,
      style: TextStyle(fontSize: 14),
      decoration: myInputDecoration(fieldValue, suffix),
      onFieldSubmitted: (value) {
        fieldValue = value;
      },
      onSaved: (value) {
        controller.text = value;
        fieldValue = value;
        setState(
          () {
            readOnly = false;
          },
        );
      },
    ).h(40).pOnly(top: 5);
  }
}
