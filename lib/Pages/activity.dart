// import 'package:clipstream/Pages/management.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
//
// class ActivityScreen extends StatefulWidget {
//   final List<String> groups =['Family', 'Senja Slackers'];
//   @override
//   _ActivityState createState() => _ActivityState();
// }
//
// class _ActivityState extends State<ActivityScreen> {
//   bool yesButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           title: Icon(Icons.timeline_sharp, color: Colors.red),
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => ManagementScreen()),
//               // );
//             },
//             child: Icon(
//               Icons.arrow_back_sharp,
//               color: Color(0xFF696969),
//             ),
//           ),
//           actions: <Widget>[
//             Padding(
//                 padding: EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: Icon(
//                     Icons.perm_contact_cal,
//                     color: Color(0xFF696969),
//                   ),
//                 )),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                   color: Color(0xFFF5F5F5),
//                   width: 400,
//                   child: Column(
//                     children: [],
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 370.0),
//               child: Visibility(
//                 visible: yesButton ? false : true,
//                 child: Container(
//                   height: 130,
//                   width: 344,
//                   color: Colors.white,
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: CircleAvatar(
//                                 backgroundImage:
//                                 ///If you want to use image from network use this code below.
//                                 NetworkImage("https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg"),
//                                 ///If you want to use image from assets use this code below.
//                                 // AssetImage('assets/images/friends.png'),
//                                 backgroundColor: Colors.transparent,
//                                 radius: 25,
//                               ),
//                             ),
//                             RichText(
//                                 text: TextSpan(
//                                     text: "Alice \n",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold),
//                                     children: <TextSpan>[
//                                   TextSpan(
//                                     text:
//                                         "shared clipstream with you. Do you want to \nadd it to your clipstream?",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       color: Color(0xFF696969),
//                                     ),
//                                   ),
//                                 ])),
//                             // Text("Alice", style: TextStyle(fontWeight: FontWeight.bold)),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: Container(
//                               color: Colors.white,
//                               height: 40,
//                               width: 350,
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 10.0),
//                                       child: SizedBox(
//                                         width: 65,
//                                         child: FlatButton(
//                                             onPressed: () {},
//                                             color: Colors.white,
//                                             child: Text(
//                                               "No",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 13),
//                                             )),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 60.0),
//                                       child: SizedBox(
//                                         width: 65,
//                                         child: FlatButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 yesButton = !yesButton;
//                                               });
//                                             },
//                                             color: Colors.white,
//                                             child: Text(
//                                               "Yes",
//                                               style: TextStyle(
//                                                   color: Colors.red,
//                                                   fontSize: 13),
//                                             )),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 12.0),
//                                       child: SizedBox(
//                                         width: 113,
//                                         child: FlatButton(
//                                             onPressed: () {},
//                                             color: Colors.red,
//                                             child: Text(
//                                               "Yes, add back",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 13),
//                                             )),
//                                       ),
//                                     ),
//                                   ])),
//                         )
//                       ]),
//                 ),
//               ),
//             ),
//             Container(
//               color: Colors.white,
//               height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Icon(Icons.access_time_rounded,
//                         color: Color(0xFF696969)),
//                   ),
//                   Text("Activiy history",
//                       style: TextStyle(color: Color(0xFF696969), fontSize: 18))
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SingleNofif extends ChangeNotifier {
//   // String _currentGroups = groups[0];
//   // String get currentGroups => _currentGroups;
// }
