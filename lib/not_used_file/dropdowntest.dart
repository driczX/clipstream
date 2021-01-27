// import 'package:flutter/material.dart';
//
// class Item {
//   const Item(this.name, this.icon);
//
//   final String name;
//   final Icon icon;
// }
//
// class DropdownHome extends StatefulWidget {
//   State createState() => DropdownHomeState();
// }
//
// class DropdownHomeState extends State<DropdownHome> {
//   Item selectedUser;
//   List<Icon> users = <Icon>[
//     const Icon(Icons.timer, color: Colors.red),
//     const Icon(Icons.hd, color: Colors.red),
//     const Icon(Icons.flash_auto, color: Colors.red),
//
//     // const Item('',Icon(Icons.hd, color: Colors.red,),
//     //   const Item('',Icon(Icons.flash_auto,color: Colors.red,)),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           title: Text(
//             'Demo Dropdown Menu Option',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Center(
//           child: DropdownButton<Item>(
//             hint: Text("Select item"),
//             value: selectedUser,
//             onChanged: (Item Value) {
//               setState(() {
//                 selectedUser = Value;
//               });
//             },
//             items: users.map((Icon user) {
//               return DropdownMenuItem<Item>(
//                   //     child: Row(
//                   //       children: <Widget>[
//                   //         user.icon,
//                   //         SizedBox(width: 10,),
//                   //         Text(
//                   //           user.name,
//                   //           style:  TextStyle(color: Colors.black),
//                   //         ),
//                   //       ],
//                   //     ),
//                   );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
