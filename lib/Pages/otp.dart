import 'package:clipstream/Pages/management.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl_phone_field/intl_phone_field.dart';



class PinCodeScreen extends StatefulWidget {
  String phoneNo;

  PinCodeScreen({
    Key key,
    @required this.phoneNo}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState(phoneNo);
}


class _PinCodeScreenState extends State<PinCodeScreen> {
  String phoneNo, phoneName, smssent, verificationId, spacedNo, codeNo;

  _PinCodeScreenState(this.phoneNo){
    RegExp exp = RegExp(r".{1,3}");
    Iterable<Match> matches = exp.allMatches(this.phoneNo);
    List<dynamic> list = [];
    matches.forEach((m)=>list.add(m.group(0)));
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
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(30.0),
    child: RichText(
      text: new TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(text: 'We just texted'),
          new TextSpan(text: '+62 821 180 672 33', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: 'a secret code. \n Enter it below to verify your number.'),
        ],
      ),
    ),
    //   child: Text(
    //       // "We just texted +62 ${this.spacedNo} a secret code. \n Enter it below to verify your number.",
    //       "We just texted +62 821 180 672 33 a secret code. \n Enter it below to verify your number.",
    //   textAlign: TextAlign.center,
    //   ),
    // ),
    // SizedBox(
    //   height: 10,
    // ),
    ),
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.name,
        onChanged: (value) {
          setState(() {
            this.codeNo = value;
          });
        },
        decoration: InputDecoration(
          hintText: "6 Digit code",
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(0.0),
            borderSide: new BorderSide(),
          ),
        ),
      ),
    ),
    ]
      ),
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 2),
      child: Visibility(
        visible: this.codeNo != '' && this.codeNo != null,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ManagementScreen()),
            );
          },
          // onPressed: verfiyPhone,
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