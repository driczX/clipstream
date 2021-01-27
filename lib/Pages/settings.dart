// import 'package:clipstream/Pages/account_settings.dart';
// import 'package:clipstream/Pages/management.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SettingScreen extends StatefulWidget {
//   @override
//   _SettingState createState() => _SettingState();
// }
//
// class _SettingState extends State<SettingScreen> {
//   bool _on = false;
//   bool _switch = false;
//   bool _check = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           title: Icon(Icons.settings, color: Colors.red),
//           actions: <Widget>[
//             Padding(
//                 padding: EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ManagementScreen()),
//                     );
//                   },
//                   child: Icon(
//                     Icons.arrow_forward_sharp,
//                     color: Color(0xFF696969),
//                   ),
//                 )),
//           ],
//         ),
//         body: Column(children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 30, right: 180),
//             child: Container(
//               child: Text(
//                 'GENERAL SETTINGS',
//                 style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
//               ),
//             ),
//           ),
//           SwitchListTile(
//             activeTrackColor: Colors.greenAccent,
//             activeColor: Colors.teal,
//             title: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 105, bottom: 4),
//                   child: Text('Geo location tagging',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(color: Colors.black)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 125),
//                   child: Text('Include location meta',
//                       style: TextStyle(color: Colors.grey, fontSize: 13)),
//                 ),
//               ],
//             ),
//             value: _on,
//             onChanged: (value) => setState(() => _on = value),
//           ),
//           SwitchListTile(
//             activeTrackColor: Colors.greenAccent,
//             activeColor: Colors.teal,
//             title: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 100, bottom: 4),
//                   child: Text('Low bandwidth mode',
//                       style: TextStyle(color: Colors.black)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 140),
//                   child: Text('Loads snaps in HD',
//                       style: TextStyle(color: Colors.grey, fontSize: 13)),
//                 ),
//               ],
//             ),
//             value: _switch,
//             onChanged: (value) => setState(() => _switch = value),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 25, right: 180),
//             child: Container(
//               child: Text(
//                 'ACCOUNT SETTINGS',
//                 style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.only(right: 180, top: 10),
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(top: 10, right: 180),
//                 child: RichText(
//                   text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                         text: 'Review / Edit Account',
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => AccountSetting()));
//                           },
//                         style: TextStyle(fontSize: 15, color: Colors.black)),
//                   ]),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 30, right: 155),
//             child: Container(
//               child: Text(
//                 'UPLOAD PREFERENCES',
//                 style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(top: 10, right: 230),
//                 child: RichText(
//                   text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                         text: 'Phone uploads',
//                         recognizer: TapGestureRecognizer()..onTap = () {},
//                         style: TextStyle(fontSize: 15, color: Colors.black)),
//                   ]),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10, right: 160),
//                 child: RichText(
//                   text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                         text: 'Over Wi-Fi or Mobile Network',
//                         recognizer: TapGestureRecognizer()..onTap = () {},
//                         style: TextStyle(fontSize: 13, color: Colors.grey)),
//                   ]),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(top: 10, right: 230),
//                 child: RichText(
//                   text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                         text: 'Video uploads',
//                         recognizer: TapGestureRecognizer()..onTap = () {
//                           },
//                         style: TextStyle(fontSize: 15, color: Colors.black)),
//                   ]),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10, right: 70, bottom: 10),
//                 child: RichText(
//                   text: TextSpan(children: <TextSpan>[
//                     TextSpan(
//                         text: 'Only when there is Wi-Fi connection available',
//                         recognizer: TapGestureRecognizer()..onTap = () {},
//                         style: TextStyle(fontSize: 13, color: Colors.grey)),
//                   ]),
//                 ),
//               ),
//             ],
//           ),
//           CheckboxListTile(
//             activeColor: Colors.teal,
//             checkColor: Colors.white,
//             title: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 130, bottom: 4),
//                   child: Text('While charging only',
//                       style: TextStyle(color: Colors.black)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Text('Uploads snaps only when a charger is connected',
//                       style: TextStyle(color: Colors.grey, fontSize: 13)),
//                 ),
//               ],
//             ),
//             value: _check,
//             onChanged: (value) => setState(() => _check = value),
//           ),
//         ]),
//       ),
//     );
//   }
// }
