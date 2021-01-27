import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/verifyingsplash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl_phone_field/intl_phone_field.dart';

class PinCodeScreen extends StatefulWidget {
  String phoneNo;

  PinCodeScreen({Key key, @required this.phoneNo}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState(phoneNo);
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String phoneNo, phoneName, smsSent, verificationId, spacedNo, codeNo;

  _PinCodeScreenState(this.phoneNo) {
    RegExp exp = RegExp(r".{1,3}");
    Iterable<Match> matches = exp.allMatches(this.phoneNo);
    List<dynamic> list = [];
    matches.forEach((m) => list.add(m.group(0)));
    this.spacedNo = list.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text('Your Code',
              style:
                  TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 35),
          child: RichText(
            text: new TextSpan(
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'We just texted ', style: TextStyle(fontSize: 15)),
                new TextSpan(
                    text: '+62 821 180 672 33',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                new TextSpan(
                    text:
                        ' a secret code. \n Enter it below to verify your number.',
                    style: TextStyle(fontSize: 15)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    this.codeNo = value;
                  });
                },
                textAlign: TextAlign.center,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  hintText: '6 Digit code',
                  // contentPadding:
                  // const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            )

            // Theme(
            //   data: Theme.of(context).copyWith(splashColor: Colors.black),
            //   child: TextFormField(
            //     textAlign: TextAlign.center,
            //     keyboardType: TextInputType.name,
            //     onChanged: (value) {
            //       setState(() {
            //         this.codeNo = value;
            //       });
            //     },
            //     decoration: InputDecoration(
            //       hintText: "6 Digit code",
            //       border: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //       enabledBorder: InputBorder.none,
            //       errorBorder: InputBorder.none,
            //       disabledBorder: InputBorder.none,
            //     ),
            //   ),
            // ),

            ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.red),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Wrong number?',
                      style: TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Wrong Number?');
                        }),
                ],
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 2),
        child: Visibility(
          visible: this.codeNo != '' && this.codeNo != null,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerifySplash()),
              );
            },
            tooltip: 'Increment',
            child: Icon(Icons.arrow_forward_sharp),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
