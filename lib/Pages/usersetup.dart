import 'dart:io';

import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneSetup extends StatelessWidget {
  PhoneSetup({Key key, this.imgPath, this.fileName}) : super(key: key);
  final imgPath;
  final fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.yellow,
                    child: Image.file(
                      File(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Clipstream!',
                        style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Let's get you set up",
                        style: GoogleFonts.sunflower(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            // you can use Flexible also
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'It should only take a couple of minutes to setup your phone to start using Clipstream.',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationPage(),
                        ), //MaterialPageRoute
                      );
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.arrow_forward_sharp),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.red),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Our Terms',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Our Terms"');
                                  }),
                          ],
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.red),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Your Privacy',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Your Privacy');
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
