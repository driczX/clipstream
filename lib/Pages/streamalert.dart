import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Clipstream'),
      content: const Text(
        "Now let's stream your first app!",
        style: TextStyle(fontSize: 14),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ButtonTheme(
            minWidth: 100,
            child: RaisedButton(
              color: Colors.white,
                elevation: 0,
                child: Text('Later', style: TextStyle(color: Colors.grey)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ButtonTheme(
            minWidth: 100,
            child: RaisedButton(
                child: Text(
                  "Let's go!",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFF3CB371),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        )
      ],
    );
  }
}

// return Container(
// color: Colors.blue,
// child: Stack(
//   alignment: Alignment.center,
// children: <Widget>[
// Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   // crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       alignment: Alignment.center,
//     child: Text("Now let's stream your first snap!",
//     style: TextStyle(color: Colors.black, fontSize: 12)),
//     width: 280,
//     height:200,
//     color: Colors.white,
// ),
//   ],
// ),
// ]
// ),
// );