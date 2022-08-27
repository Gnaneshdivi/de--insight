import 'dart:io';

import 'package:cryptosplit/API/authfunctions.dart';
import 'package:cryptosplit/Globals/globals.dart';
import 'package:cryptosplit/Screens/Home_Screen/homescreen.dart';
import 'package:cryptosplit/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static const id = 'AuthenticationScreen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

String? validateemail(String value) {
  if ((value.contains('@')) && value.isNotEmpty) {
    return "Improper mail id";
  }
  return null;
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  var mailid;
  var password;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Container(
              height: screenHeight(context),
              width: screenWidth(context) * 0.35,
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            Container(
              height: screenHeight(context),
              width: screenWidth(context) * 0.55,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: screenWidth(context) * 0.45,
                        child: Image.asset('assets/abc.png')),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      width: screenWidth(context) * 0.3,
                      child: Row(
                        children: [
                          Text(
                            'WE3',
                            style: TextStyle(color: Colors.black, fontSize: 40),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: screenWidth(context) * 0.3,
                      child: TextField(
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Mail ID',
                        ),
                        onChanged: (text) {
                          setState(() {
                            mailid = text;
                            //you can access nameController in its scope to get
                            // the value of text entered as shown below
                            //fullName = nameController.text;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: screenWidth(context) * 0.3,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Password',
                        ),
                        onChanged: (text) {
                          setState(() {
                            password = text;
                            //you can access nameController in its scope to get
                            // the value of text entered as shown below
                            //fullName = nameController.text;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      width: screenWidth(context) * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              minimumSize: Size(screenWidth(context) * 0.1,
                                  screenHeight(context) * 0.1),
                            ),
                            onPressed: () {
                              if (mailid != null &&
                                  password != null &&
                                  mailid.toString().contains('@')) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  HomeScreen.id,
                                );
                              }
                            },
                            child: const Text(
                              "SUBMIT",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
