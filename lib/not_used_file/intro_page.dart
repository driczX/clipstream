// // import 'dart:html';
// import 'dart:io';
//
// import 'package:clipstream/Pages/management.dart';
// import 'package:clipstream/Pages/setup.dart';
// import 'package:clipstream/Pages/verification.dart';
// import 'package:flutter/material.dart';
// import 'package:intro_slider/dot_animation_enum.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
// import 'package:intro_slider/scrollbar_behavior_enum.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
// //import 'package:intro_slider_example/home.dart';
//
// class IntroScreen extends StatefulWidget {
//   IntroScreen({Key key, this.imgPath, this.fileName}) : super(key: key);
//   final String imgPath;
//   final String fileName;
//
//   @override
//   IntroScreenState createState() => new IntroScreenState();
// }
//
// class IntroScreenState extends State<IntroScreen> {
//   List<Slide> slides = new List();
//   Widget _buildImage(String assetName) {
//     return Align(
//       // child: Image.asset('assets/images/switch.jpg', width: 10.0),
//       alignment: Alignment.bottomCenter,
//     );
//   }
//
//   Function goToTab;
//
//   @override
//   void initState() {
//     super.initState();
//     PageViewModel (
//       title: "Fractional shares",
//       body:
//       "Instead of having to buy an entire share, invest any amount you want.",
//       image: _buildImage('img1'),
//     );
//     slides.add(
//       new Slide(
//         title: "",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//         "Just turn on the magic switch to have your photos and videos shared instantly!",
//         // description: "Just turn on the magic switch to have your photos and videos shared instantly!",
//         styleDescription: TextStyle(
//             color: Colors.white,
//             fontSize: 17.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/switch.jpg",
//         widthImage: 100.0,
//       ),
//     );
//
//     slides.add(
//       new Slide(
//         title: "",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//         "You can create different groups for your photos to appear in. Switch between these groups easily for your photos to be seen by the right audience. Sharing was yesterday, streaming is now.",
//         styleDescription: TextStyle(
//             color: Colors.white,
//             fontSize: 17.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/one.png",
//       ),
//     );
//
//     slides.add(
//       new Slide(
//         title: "",
//         styleTitle: TextStyle(
//             color: Color(0xff3da4ab),
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description:
//         "You cannot become a friend by request - you need to gain it. You decide who can see your content without having to connect. This is true sharing and caring.",
//         styleDescription: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/icon.png",
//       ),
//     );
//   }
//
//   void onDonePress() {
//     // Back to the first tab
//     // this.nogoToTab(0);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ManagementScreen()),
//     );
//   }
//
//   void onSkipPress(){
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ManagementScreen()),
//     );
//   }
//
//   void onTabChangeCompleted(index) {
//     // Index of current tab is focused
//   }
//
//   Widget renderNextBtn() {
//     return Text(
//       'Next',
//       style: TextStyle(
//         color: Colors.red,
//         fontSize: 14.0,
//       ),
//     );
//   }
//
//   Widget renderDoneBtn() {
//     return Text(
//       'Finish',
//       style: TextStyle(
//         color: Colors.red,
//         fontSize: 14.0,
//       ),
//     );
//   }
//
//   Widget renderSkipBtn() {
//     return Text(
//       'Skip',
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: 14.0,
//       ),
//     );
//   }
//
//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = new List();
//     for (int i = 0; i < slides.length; i++) {
//       Slide currentSlide = slides[i];
//       tabs.add(Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
//           child: ListView(
//             children: <Widget>[
//               GestureDetector(
//                   child: Image.asset(
//                     currentSlide.pathImage,
//                     width: 200.0,
//                     height: 200.0,
//                     fit: BoxFit.contain,
//                   )),
//               Container(
//                 child: Text(
//                   currentSlide.title,
//                   style: currentSlide.styleTitle,
//                   textAlign: TextAlign.center,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//               Container(
//                 child: Text(
//                   currentSlide.description,
//                   style: currentSlide.styleDescription,
//                   textAlign: TextAlign.center,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//             ],
//           ),
//         ),
//       ));
//     }
//     return tabs;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // return LayoutBuilder(
//     //   builder: (BuildContext context, BoxConstraints constraints) {
//     // return Container(
//     //   height: constraints.maxHeight / 2,
//     //   width: MediaQuery.of(context).size.width /2
//     return Scaffold(
//       // body: Container(
//       // child: Column(
//       //       crossAxisAlignment: CrossAxisAlignment.stretch,
//       //       children: <Widget>[
//       //         Expanded(
//       //           flex: 2,
//       // child: Image.file(
//       //   File(widget.imgPath),
//       // fit: BoxFit.cover,
//       // ),
//       body: Stack(
//         children: [
//           Positioned(
//             child: Container(
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               color: Colors.yellow,
//               //child: Image.asset("assets/images/one.png"),
//               child: Image.file(
//                 File(widget.imgPath),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             height: MediaQuery
//                 .of(context)
//                 .size
//                 .height *0.6,
//             margin: EdgeInsets.only(top: MediaQuery
//                 .of(context)
//                 .size
//                 .height *0.4),
//             child: new IntroSlider(
//               // List slides
//               slides: this.slides,
//
//               // Skip button
//               renderSkipBtn: this.renderSkipBtn(),
//               onSkipPress: this.onSkipPress,
//               // colorSkipBtn: Colors.white,
//               highlightColorSkipBtn: Colors.white,
//
//               // Next button
//               renderNextBtn: this.renderNextBtn(),
//
//               // Done button
//               renderDoneBtn: this.renderDoneBtn(),
//               onDonePress: this.onDonePress,
//               colorDoneBtn: Colors.white,
//               highlightColorDoneBtn: Colors.white,
//
//               // Dot indicator
//               colorDot: Color(0xff000000),
//               colorActiveDot: Color(0xFFFFFFFF),
//               sizeDot: 13.0,
//
//               // Tabs
//               listCustomTabs: this.renderListCustomTabs(),
//               backgroundColorAllSlides: Colors.red,
//               refFuncGoToTab: (refFunc) {
//                 this.goToTab = refFunc;
//               },
//
//               // Show or hide status bar
//               shouldHideStatusBar: true,
//
//               // On tab change completed
//               onTabChangeCompleted: this.onTabChangeCompleted,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // @override
// //   Widget build(BuildContext context) {
// //     return new IntroSlider(
// //       // List slides
// //       slides: this.slides,
// //
// //       // Skip button
// //       renderSkipBtn: this.renderSkipBtn(),
// //       onSkipPress: this.onSkipPress,
// //       // colorSkipBtn: Colors.white,
// //       highlightColorSkipBtn: Colors.white,
// //
// //       // Next button
// //       renderNextBtn: this.renderNextBtn(),
// //
// //       // Done button
// //       renderDoneBtn: this.renderDoneBtn(),
// //       onDonePress: this.onDonePress,
// //       colorDoneBtn: Colors.white,
// //       highlightColorDoneBtn: Colors.white,
// //
// //       // Dot indicator
// //       colorDot: Color(0xff000000),
// //       colorActiveDot: Color(0xffffffff),
// //       sizeDot: 13.0,
// //
// //       // Tabs
// //       listCustomTabs: this.renderListCustomTabs(),
// //       backgroundColorAllSlides: Colors.red,
// //       refFuncGoToTab: (refFunc) {
// //         this.goToTab = refFunc;
// //       },
// //
// //       // Show or hide status bar
// //       shouldHideStatusBar: true,
// //
// //       // On tab change completed
// //       onTabChangeCompleted: this.onTabChangeCompleted,
// //     );
// //   }
// // }