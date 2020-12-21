// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String uid = "";
//
//   getUid() {}
//
//   @override
//   void initState() {
//     setState(() {
//       var val;
//       this.uid = val.uid;
//     });
//     this.uid = "";
//     FirebaseAuth.instance.currentUser;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome"),
//       ),
//       body: Center(
//         child: Text("Welcome to HomePage \n $uid"),
//       ),
//     );
//   }
//
// }