// import 'package:flutter/material.dart';
//
//
// class NewGroup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       title: Text('New Group'),
//       content: TextField (
//         onChanged: (value) {},
//         decoration: InputDecoration(hintText: "Enter new group name"),
//       ),
//       actions: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: ButtonTheme(
//             minWidth: 50,
//             child: RaisedButton(
//                 color: Colors.white,
//                 elevation: 0,
//                 child: Text('Cancel', style: TextStyle(color: Colors.teal)),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 }),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 20.0),
//           child: ButtonTheme(
//             minWidth: 50,
//             child: RaisedButton(
//                 color: Colors.white,
//                 elevation: 0,
//                 child: Text(
//                   "Create",
//                   style: TextStyle(color: Colors.teal),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 }),
//           ),
//         )
//       ],
//     );
//   }
// }