// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

final _formKey2 = GlobalKey<FormState>();

class _PasswordState extends State<Password> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void dispose() {
    _confirmPass.dispose();
    _pass.dispose();
    super.dispose();
  }

  bool _oldpasswordVisibility = false;
  bool _newpasswordVisibility = false;
  bool _passwordMatched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: 'Change Password'.text.headline3(context).make(),
          // iconTheme: IconTheme(),

          actions: [
            IconButton(
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
                        _formKey2.currentState!.save();
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Change Password Button Pressed'),
                        duration: const Duration(seconds: 1),
                      ));
                    },
                    icon: const Icon(Icons.check))
                .pOnly(right: 12)
          ],
        ),
        body: SafeArea(
          child: Form(
            key: _formKey2,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {});
                      },
                      title: 'Old Password'.text.bodyText1(context).make(),
                      subtitle: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red[100]!),
                            ),
                            suffixIcon: _oldpasswordVisibility == true
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _oldpasswordVisibility = false;
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.eye),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _oldpasswordVisibility = true;
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.eye_slash),
                                  ),
                          ),
                          obscureText:
                              _oldpasswordVisibility == true ? false : true,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          cursorHeight: 30,
                          cursorWidth: 3,
                          onFieldSubmitted: (value) {},
                          onSaved: (value) {
                            setState(() {});
                          }).h(40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {});
                      },
                      title: 'New Password'.text.bodyText1(context).make(),
                      subtitle: TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[100]!),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red[100]!),
                            ),
                            suffixIcon: _newpasswordVisibility == true
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _newpasswordVisibility = false;
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.eye),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _newpasswordVisibility = true;
                                      });
                                    },
                                    icon: Icon(CupertinoIcons.eye_slash),
                                  ),
                          ),
                          controller: _pass,
                          obscureText:
                              _newpasswordVisibility == true ? false : true,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          cursorHeight: 30,
                          cursorWidth: 3,
                          onSaved: (value) {
                            // _newPassword = value;
                            setState(() {});
                          },
                          onChanged: (String value) {
                            if (value == _confirmPass.text &&
                                value.isNotEmpty) {
                              setState(() {
                                _passwordMatched = true;
                              });
                            } else {
                              setState(() {
                                _passwordMatched = false;
                              });
                            }
                          },
                          validator: (val) {
                            if (val!.isEmpty) {}
                            return null;
                          }).h(40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {});
                      },
                      title:
                          'Confirm New Password'.text.bodyText1(context).make(),
                      subtitle: TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[100]!),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[100]!),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[100]!),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey[100]!),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red[100]!),
                          ),
                        ),
                        controller: _confirmPass,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        cursorHeight: 30,
                        cursorWidth: 3,
                        onFieldSubmitted: (value) {},
                        onSaved: (value) {
                          setState(() {});
                        },
                        onChanged: (String value) async {
                          if (value == _pass.text && value.isNotEmpty) {
                            setState(() {
                              _passwordMatched = true;
                            });
                          } else {
                            setState(() {
                              _passwordMatched = false;
                            });
                          }
                        },
                        validator: (val) {
                          if (val!.isEmpty && val.length < 8) {
                            'Password length must have atleast 8 characters';
                          }
                          if (val == _pass.text) {
                            setState(() {
                              _passwordMatched = true;
                            });
                          }
                          return null;
                        },
                      ).h(40),
                    ),
                    _passwordMatched == true
                        ? "Password matched"
                            .text
                            .green500
                            .makeCentered()
                            .pOnly(top: 10)
                        : "Password doesn't matched"
                            .text
                            .red500
                            .makeCentered()
                            .pOnly(top: 10),
                    // Spacer(),
                  ],
                ).p12(),
              ).cornerRadius(8).p16(),
            ),
          ),
        ));
  }
}
