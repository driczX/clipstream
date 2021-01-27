import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('I\'m an App'),
          backgroundColor: Colors.red[600],
        ),
        body: MyApps(),
      ),
    ),
  );
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.only(top: 20, right: 50),
      child: Container(
        color: Colors.green,
        // Add 200px on top and bottom
        margin: EdgeInsets.symmetric(vertical: 200),
        child: Container(
          color: Colors.yellow,
          margin: EdgeInsets.fromLTRB(0, 20, 200, 20),
        ),
      ),
    );
  }
}