import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/usersetup.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class VerifySplash extends StatefulWidget {
  @override
  _VerifySplashState createState() => _VerifySplashState();
}

class _VerifySplashState extends State<VerifySplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: test(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ManagementScreen(),
    )
    );
  }

  @override
  test(BuildContext context){
    return Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Verifying...",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
