import 'dart:io';

import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  XFile? _imageFile;
  String? url;
  bool readOnly = false;
  int _selectSession = 0;
  int _selectScale = 0;
  bool ok = false;

  TextEditingController recipeCntrl = TextEditingController();
  TextEditingController quantityCntrl = TextEditingController();
  final TextEditingController _recipeIngridientsController =
      TextEditingController();
  final TextEditingController _recipeDescriptionController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var alertDialogMessage = '';
  var alertDialogMessage2 = '';
  final String _recipeName = 'Fried Rice';
  final String _quantity = 'Quantity';
  final String _recipeIngridients = 'Add Ingridients';
  final String _recipeDescription = 'Add Recipe Description';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    recipeCntrl.dispose();
    quantityCntrl.dispose();
    _recipeIngridientsController.dispose();
    _recipeDescriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        'Photo Tracking',
        action: [
          IconButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.check))
              .pOnly(right: 10)
        ],
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        elevation: MaterialStateProperty.all(0)),
                    onPressed: () => showModalBottomSheet(
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
                                ]).p16(),
                          ),
                        ),
                    icon: const Icon(Icons.photo_camera),
                    label: 'Select Recipe Picture'.text.make()),
                const HeightBox(5),
                Stack(
                  children: [
                    Card(
                      child: _imageFile == null
                          ? const Placeholder(
                              color: Colors.white,
                            ).wh(1, 1)
                          : Image.file(File(_imageFile!.path)),
                    ).cornerRadius(5),
                    if (_imageFile != null)
                      Positioned(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _imageFile = null;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              )))
                  ],
                ),
                const HeightBox(10),
                recipeName(),
                const HeightBox(10),
                recipeIngridients(),
                const HeightBox(10),
                recipeDescription(),
                const HeightBox(10),
                session(),
                const HeightBox(10),
                quantity(),
                const HeightBox(10),
                scale(),
                const HeightBox(10),
              ],
            ).p12(),
          ),
        ),
      ).cornerRadius(5).p16().wFull(context),
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

  Widget recipeName() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
          });
        },
        title: 'Recipe Name*'.text.bodyText1(context).make(),
        subtitle: tff(_recipeName, '', recipeCntrl, setState, context));
  }

  Widget recipeIngridients() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
        });
      },
      title: 'Recipe Ingridients'.text.bodyText1(context).make(),
      subtitle: tff(_recipeIngridients, '', _recipeIngridientsController,
              setState, context,
              maxlines: null, expands: true)
          .h(150),
    );
  }

  Widget recipeDescription() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
        });
      },
      title: 'Recipe description*'.text.bodyText1(context).make(),
      subtitle: tff(_recipeDescription, '', _recipeDescriptionController,
              setState, context,
              maxlines: null, expands: true)
          .h(150),
    );
  }

  Widget quantity() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
          });
        },
        title: 'Quantity'.text.bodyText1(context).make(),
        subtitle: tff(_quantity, '', quantityCntrl, setState, context));
  }

  Widget session() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            readOnly = true;
          });
        },
        title: 'Session'.text.bodyText1(context).make(),
        subtitle: InkWell(
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
                    : ''.text.bodyText2(context).gray500.make(),
                const Icon(Icons.arrow_drop_down),
              ],
            ).pSymmetric(h: 12),
          ).h(40),
          onTap: () {
            showDialogBox(context);
            setState(() {});
          },
        ));
  }

  List<String> sessions = <String>[
    'Breakfast',
    'Morning Snacks',
    'Lunch',
    'Evening Snacks',
    'Dinner',
    'Late night food'
  ];

  Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: AlertDialog(
                actions: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: 'Session'.text.bodyText2(context).bold.make()),
                  const Divider(),
                  SizedBox(
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: sessions.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: index,
                              groupValue: _selectSession,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectSession = value!;
                                });
                                _selectSession = value!;
                              }),
                          title: sessions[index].text.headline6(context).make(),
                        ),
                      ),
                    ),
                  ).hOneThird(context),
                  const Divider(),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              // _selectSession = false;
                              // ok = false;
                              Navigator.pop(context);
                            });
                          },
                          child:
                              'Cancel'.text.headline3(context).blue500.make()),
                      TextButton(
                          onPressed: () {
                            // if (_selectSession == true) {
                            //   ok = true;
                            // } else {
                            //   ok = false;
                            // }
                            Navigator.of(context).pop();
                            setState(() {
                              ok = true;
                              alertDialogMessage = sessions[_selectSession];
                            });
                          },
                          child: 'Ok'.text.headline3(context).blue500.make()),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget scale() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        setState(() {
          readOnly = true;
        });
      },
      title: 'Scale'.text.bodyText1(context).make(),
      subtitle: InkWell(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey[100]!),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ok == true
                  ? alertDialogMessage2.text
                      .bodyText2(context)
                      .color(Colors.lightBlue)
                      .make()
                  : ''.text.bodyText2(context).gray500.make(),
              const Icon(Icons.arrow_drop_down),
            ],
          ).pSymmetric(h: 12),
        ).h(40),
        onTap: () {
          showDialogBox2(context);
          setState(() {});
        },
      ),
    );
  }

  List<String> scales = <String>[
    'oz',
    'tbsp',
    'fillet',
    'cup, secitons',
    'cup (8fl oz)',
    'cup (16fl oz)'
  ];

  Future<dynamic> showDialogBox2(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: AlertDialog(
                actions: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: 'Scale'.text.bodyText2(context).bold.make()),
                  const Divider(),
                  SizedBox(
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: scales.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: index,
                              groupValue: _selectScale,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectScale = value!;
                                });
                                _selectScale = value!;
                              }),
                          title: scales[index].text.headline6(context).make(),
                        ),
                      ),
                    ),
                  ).hOneThird(context),
                  const Divider(),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              // _selectScale = false;
                              // ok = false;
                              Navigator.pop(context);
                            });
                          },
                          child:
                              'Cancel'.text.headline3(context).blue500.make()),
                      TextButton(
                          onPressed: () {
                            // if (_selectScale == true) {
                            //   ok = true;
                            // } else {
                            //   ok = false;
                            // }
                            Navigator.of(context).pop();
                            setState(() {
                              ok = true;
                              alertDialogMessage2 = scales[_selectScale];
                            });
                          },
                          child: 'Ok'.text.headline3(context).blue500.make()),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
