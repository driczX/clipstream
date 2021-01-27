import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertAudience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Clipstream'),
      content: const Text(
          'Let those who matter to you become the audience of your snaps. Start to strengthen meaningful relationship.',
      style: TextStyle(fontSize: 14),),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 20.0),
          child: ButtonTheme(
            minWidth: 230,
            child: RaisedButton.icon(
              color: Color(0xFF3CB371),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              label: Text('Manage audience', style: TextStyle(color: Colors.white)),
              // child: Text('Ok'),
              // onPressed: () {
              //   Navigator.of(context).pop();
              // },
            ),
          ),
        ),
      ],
    );
  }
}
