// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, duplicate_ignore, use_build_context_synchronously, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/user_simple_preferences.dart';
import '../../widgets/all_widgets.dart';

class EditUserProfile extends StatefulWidget {
  EditUserProfile({Key? key}) : super(key: key);

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  XFile? _imageFile;
  String name = "";
  DateTime? date;
  bool changeButton = false;
  String? _btn3SelectedVal;
  bool? readOnly;
  String _fname = '';
  String _lname = '';
  final String _phone = '92540 24221';
  final String _feet = '5';
  final String _inch = '10';
  final String _weight = '60';

  final _formKey3 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fname = UserSimplePreferences.getUsername() ?? '';
    _lname = UserSimplePreferences.getLname() ?? '';

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
      appBar: myAppBar(
        context,
        "Edit Profile",
        action: [
          readOnly == true
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      readOnly = false;
                    });
                  },
                  child: "Edit".text.red500.bold.make())
              : IconButton(
                      onPressed: () async {
                        await UserSimplePreferences.setUsername(_fname);
                        UserSimplePreferences.setLname(_lname);
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
                InkWell(
                  onTap: () {
                    readOnly == true
                        ? null
                        : showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              color: Colors.white,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Select mode of picture"
                                        .text
                                        .gray500
                                        .xl
                                        .make(),
                                    const Divider(),
                                    ListTile(
                                      onTap: () async =>
                                          await _pickImageFromCamera(),
                                      leading: const Icon(
                                        Icons.camera,
                                        color: Colors.blue,
                                      ),
                                      title: 'Take photo'
                                          .text
                                          .bodyText2(context)
                                          .make(),
                                    ),
                                    ListTile(
                                      onTap: () async =>
                                          await _pickImageFromGallery(),
                                      leading: const Icon(
                                        Icons.photo,
                                        color: Colors.green,
                                      ),
                                      title: 'Pick from gallery'
                                          .text
                                          .bodyText2(context)
                                          .make(),
                                    ),
                                    if (_imageFile != null)
                                      ListTile(
                                        onTap: () => setState(() {
                                          _imageFile = null;
                                        }),
                                        leading: const Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        title: 'Remove Image'
                                            .text
                                            .bodyText2(context)
                                            .make(),
                                      ),
                                  ]).p16(),
                            ),
                          );
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[100],
                    child: ClipOval(
                      child: _imageFile == null
                          ? const Placeholder(
                              color: Colors.transparent,
                            )
                          : Image.file(
                              fit: BoxFit.cover, File(_imageFile!.path)),
                    ).wh(200, 200),
                  ).centered(),
                ).wh(140, 140).centered(),

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
                      subtitle: tff('', 'ft', _feet, setState, context,
                          readOnly: readOnly),
                    ).wOneThird(context),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: ''.text.bodyText1(context).make(),
                      subtitle: tff('', 'inch', _inch, setState, context,
                          readOnly: readOnly),
                    ).wOneThird(context),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: 'Weight'.text.bodyText1(context).make(),
                  subtitle: tff('', 'lbs', _weight, setState, context,
                      readOnly: readOnly),
                ).wOneThird(context),
              ],
            ).p16(),
          ).p16(),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? imageFile =
        (await ImagePicker().pickImage(source: ImageSource.gallery));
    setState(() => _imageFile = imageFile);
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? imageFile =
        (await ImagePicker().pickImage(source: ImageSource.camera));
    setState(() => _imageFile = imageFile);
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

  Row selectGender() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      'Gender*'.text.bodyText1(context).make(),
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.blueGrey[100]!,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
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
          ).p4(),
        ),
      ).h(40),
    ]);
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
        subtitle: tff('Enter your phone no.', '', _phone, setState, context,
            readOnly: readOnly));
  }

  Widget lastName() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
        });
      },
      title: 'Last Name'.text.bodyText1(context).make(),
      subtitle: tff('Enter Last Name', '', _lname, setState, context,
          readOnly: readOnly),
    );
  }

  Widget firstname() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
          });
        },
        title: 'First Name'.text.bodyText1(context).make(),
        subtitle: tff('Enter First Name', '', _fname, setState, context,
            readOnly: readOnly));
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
}
