import 'package:clipstream/Pages/management.dart';
import 'package:flutter/material.dart';


class ActivityScreen extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Icon(Icons.timeline_sharp,
              color: Colors.red),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManagementScreen()),
              );
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF696969),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Icon(
                    Icons.perm_contact_cal,
                    color: Color(0xFF696969),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}