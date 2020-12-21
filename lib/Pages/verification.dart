///If this code is not used, the error on preview screen won't show

import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl_phone_field/intl_phone_field.dart';

//import 'logout.dart';
//yang di komen itu kode sebelumnya

class VerificationPage extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<VerificationPage> {
  String phoneNo, phoneName, smssent, verificationId, partNo;

  get verifiedSuccess => null;

  Future<void> verfiyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResent]) {
      this.verificationId = verId;
      // smsCodeDialoge(context).then((value) {
      //   print("Code Sent");
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PinCodeScreen(phoneNo: partNo)),
      );
    };
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {};
    final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e) {
      //(AuthException e)
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  Future<bool> smsCodeDialoge(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter OTP'),
            content: TextField(
              onChanged: (value) {
                this.smssent = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  User currentUser = FirebaseAuth.instance.currentUser;
                  // FirebaseAuth.instance.currentUser.then(){
                  if (currentUser != null) {
                    //user!=null
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManagementScreen()),
                    );
                  } else {
                    Navigator.of(context).pop();
                    signIn(smssent);
                  }
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }

  Future<void> signIn(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ManagementScreen(),
        ),
      );
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text('Phone Setup',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 14),
            child: Container(
              child: Text('Make it easy for friends to join you on Clipstream.',
                  style: TextStyle(fontSize: 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                setState(() {
                  this.phoneName = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Full name",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(0.0),
                  borderSide: new BorderSide(),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 100,
          width: 400,
            child: IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              keyboardType: TextInputType.number,
              initialCountryCode: 'ID',
              onChanged: (value) {
                setState(() {
                  print(value.completeNumber + " " + value.number);
                  this.phoneNo = value.completeNumber;
                  this.partNo = value.number;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 88, left: 5),
            child: Container(
              child: Text('This number will be used for security purpose.',
                  style: TextStyle(fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 1.0,
          ),
          // Container(
          //   child: Align (
          //     alignment: Alignment.center,
          // FloatingActionButton(
          //       onPressed: verfiyPhone,
          //       child: Icon(
          //         Icons.arrow_forward_sharp,
          //         color: Colors.white,
          //       ),
          //       backgroundColor: Colors.red,
          //     ),
          //  ),
          // ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 2),
        child: Visibility(
          visible: this.phoneNo != '' &&
              this.phoneName != '' &&
              this.phoneNo != null &&
              this.phoneName != null,
          child: FloatingActionButton(
            onPressed: verfiyPhone,
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
