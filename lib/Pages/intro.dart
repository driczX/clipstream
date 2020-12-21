import 'dart:io';

import 'package:clipstream/intro_views_flutter/Models/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:clipstream/intro_views_flutter/intro_views_flutter.dart';

/// App widget class

class OnBoard extends StatelessWidget {
  OnBoard({Key key, this.imgPath, this.fileName}) : super(key: key);
  final imgPath;
  final fileName;
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: Colors.red,
        // iconImageAssetPath: 'assets/air-hostess.png',
        // bubble: Image.asset('assets/images/switch.jpg'),
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            'You can now share your moments instantly as \n you snap with Clipstream camera.',
          ),
        ),
        body: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Just turn on the magic switch to have your \n photos and videos shared instanly!',
            textAlign: TextAlign.left,
          ),
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15),
        mainImage: Image.asset(
            'assets/images/switch.jpg',
            height: 150.0,
            width: 150.0,
            // alignment: Alignment.center,
          ),
        ),
    PageViewModel(
      pageColor: Colors.red,
      // iconImageAssetPath: 'assets/images/icon.png',
      title: Container(
        alignment: Alignment.topLeft,
        child: Text('Perfect control over your audience.',
            textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: Text(
          'You can create different groups for your photos to appear in. Switch between these groups easily for your photos to be seen by the right audience. Sharing was yesterday, streaming is now.',
          textAlign: TextAlign.left,
        ),
      ),
      mainImage: Image.asset(
        'assets/images/contact.png',
        height: 145.0,
        width: 100.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white,fontSize: 15),
    ),
    PageViewModel(
      pageColor: Colors.red,
      // iconImageAssetPath: 'assets/images/icon.png',
      title: Container(
        child: Text('No more friend requests. Because we believe in meaningful relationships.',
            textAlign: TextAlign.left),
      ),
      body: Container(
        child: Text(
          'You cannot become a friend by request - you need to gain it. You decide who can see your content without having to connect. This is true sharing and caring.',
            textAlign: TextAlign.left),
      ),
      mainImage: Image.asset(
        'assets/images/friends.png',
        height: 160.0,
        width: 160.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: 15),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.yellow,
              child: Image.file(
                  File(imgPath),
                  fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height *0.6,
            margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height *0.4),
          child: IntroViewsFlutter(
              pages,
              showNextButton: true,
              showBackButton: false,
              onTapDoneButton: () {},
            imgPath: imgPath,
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ), //IntroViewsFlutter
    );//Material App
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.red,
  //     ), //ThemeData
  //     home: Builder(
  //       builder: (context) => IntroViewsFlutter(
  //         pages,
  //         showNextButton: true,
  //         showBackButton: false,
  //         onTapDoneButton: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => HomePage(),
  //             ), //MaterialPageRoute
  //           );
  //         },
  //         pageButtonTextStyles: TextStyle(
  //           color: Colors.white,
  //           fontSize: 18.0,
  //         ),
  //       ), //IntroViewsFlutter
  //     ), //Builder
  //   ); //Material App
  // }
}

/// Home Page of our example app.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ), //Appbar
      body: Center(
        child: Text("This is the home page of the app"),
      ), //Center
    ); //Scaffold
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
// class OnBoardingPage extends StatefulWidget {
//   @override
//   _OnBoardingPageState createState() => _OnBoardingPageState();
// }
//
// class _OnBoardingPageState extends State<OnBoardingPage> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//
//   void _onIntroEnd(context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => HomePage()),
//     );
//   }
//
//   Widget _buildImage(String assetName) {
//     return Align(
//       child: Image.asset('assets/images', width: 100.0),
//       alignment: Alignment.bottomCenter,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const bodyStyle = TextStyle(fontSize: 19.0);
//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       bodyTextStyle: bodyStyle,
//       descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
//       pageColor: Colors.white,
//       imagePadding: EdgeInsets.zero,
//     );
//
//     return IntroductionScreen(
//       key: introKey,
//       pages: [
//         PageViewModel(
//           title: "Fractional shares",
//           image: Center(child: Image.asset("assets/images/switch.jpg", height: 200.0)),
//           body:
//           "Instead of having to buy an entire share, invest any amount you want.",
//           decoration: PageDecoration(
//             titlePadding: EdgeInsets.only(bottom: 0)
//           )
//         ),
//         PageViewModel(
//           title: "Learn as you go",
//           body:
//           "Download the Stockpile app and master the market with our mini-lesson.",
//           image: _buildImage('img2'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Kids and teens",
//           body:
//           "Kids and teens can track their stocks 24/7 and place trades that you approve.",
//           image: _buildImage('img3'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Another title page",
//           body: "Another beautiful body text for this example onboarding",
//           image: _buildImage('img2'),
//           footer: RaisedButton(
//             onPressed: () {
//               introKey.currentState?.animateScroll(0);
//             },
//             child: const Text(
//               'FooButton',
//               style: TextStyle(color: Colors.white),
//             ),
//             color: Colors.lightBlue,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Title of last page",
//           bodyWidget: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text("Click on ", style: bodyStyle),
//               Icon(Icons.edit),
//               Text(" to edit a post", style: bodyStyle),
//             ],
//           ),
//           image: _buildImage('img1'),
//           decoration: pageDecoration,
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
//       showSkipButton: true,
//       skipFlex: 0,
//       nextFlex: 0,
//       skip: const Text('Skip'),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
//       dotsDecorator: const DotsDecorator(
//         size: Size(10.0, 10.0),
//         color: Color(0xFFBDBDBD),
//         activeSize: Size(22.0, 10.0),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: const Center(child: Text("This is the screen after Introduction")),
//     );
//   }
// }