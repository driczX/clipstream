// import 'dart:html';
import 'dart:io';

import 'package:clipstream/Pages/verification.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

//import 'package:intro_slider_example/home.dart';

class SetupScreen extends StatefulWidget {
  SetupScreen({Key key, this.imgPath, this.fileName}) : super(key: key);
  final String imgPath;
  final String fileName;

  @override
  SetupScreenState createState() => new SetupScreenState();
}

class SetupScreenState extends State<SetupScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title:"It should only take a couple of minute to setup your phone to start using Clipstream.",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "It should only take a couple of minute to setup your phone to start using Clipstream.",
        // description: "Just turn on the magic switch to have your photos and videos shared instantly!",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 10.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/switch.jpg",
      ),
    );
  }

  // void onDonePress() {
  //   // Back to the first tab
  //   // this.goToTab(0);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => VerificationPage()),
  //   );
  // }

  void onSkipPress(){
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => VerificationPage()),
    // );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  // Widget renderNextBtn() {
  //   return Text(
  //     'Next',
  //     style: TextStyle(
  //       color: Colors.red,
  //       fontSize: 14.0,
  //     ),
  //   );
  // }
  //
  // Widget renderDoneBtn() {
  //   return Text(
  //     'Finish',
  //     style: TextStyle(
  //       color: Colors.red,
  //       fontSize: 14.0,
  //     ),
  //   );
  // }

  Widget renderSkipBtn() {
    return Icon(Icons.arrow_forward_sharp,
        size: 10,
        color: Colors.black,
      );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(
    //   builder: (BuildContext context, BoxConstraints constraints) {
    // return Container(
    //   height: constraints.maxHeight / 2,
    //   width: MediaQuery.of(context).size.width /2
    return Scaffold(
      // body: Container(
      // child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         Expanded(
      //           flex: 2,
      // child: Image.file(
      //   File(widget.imgPath),
      // fit: BoxFit.cover,
      // ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.yellow,
              //child: Image.asset("assets/images/one.png"),
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height *0.4,
            margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height *0.6),
            child: new IntroSlider(
              // List slides
              slides: this.slides,

              // Skip button
              renderSkipBtn: this.renderSkipBtn(),
              onSkipPress: this.onSkipPress,
              // colorSkipBtn: Colors.white,
              highlightColorSkipBtn: Colors.white,

              // // Next button
              // renderNextBtn: this.renderNextBtn(),
              //
              // // Done button
              // renderDoneBtn: this.renderDoneBtn(),
              // onDonePress: this.onDonePress,
              // colorDoneBtn: Colors.white,
              // highlightColorDoneBtn: Colors.white,

              // Dot indicator
              // colorDot: Color(0xff000000),
              // colorActiveDot: Color(0xFFFFFFFF),
              // sizeDot: 13.0,

              // Tabs
              listCustomTabs: this.renderListCustomTabs(),
              backgroundColorAllSlides: Colors.white,
              refFuncGoToTab: (refFunc) {
                this.goToTab = refFunc;
              },

              // Show or hide status bar
              shouldHideStatusBar: true,

              // On tab change completed
              onTabChangeCompleted: this.onTabChangeCompleted,
            ),
          ),
        ],
      ),
    );
  }
}
