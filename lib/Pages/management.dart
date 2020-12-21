import 'package:clipstream/Pages/activity.dart';
import 'package:clipstream/Pages/dropdown.dart';
import 'package:clipstream/Pages/imagepicker.dart';
import 'package:clipstream/Pages/settings.dart';
import 'package:clipstream/screen/camera.dart';
import 'package:clipstream/screen/camerapreview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';

class ManagementScreen extends StatefulWidget {
  @override
  _ManagementState createState() => _ManagementState();
}

class _ManagementState extends State<ManagementScreen> {
  String currentTab;
  bool isEveryoneButtonPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      displayBottomSheet(context);
    });
    currentTab = "Me";
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white.withOpacity(0.8),
        barrierColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.3,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    // alignment: Alignment.topCenter,
                    child: Text("Your snap taken with Clipstream Camera will appear here including pictures on your phone storage.",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      color: Colors.red,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Got it', style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                ]
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (currentTab == null) {
      setState(() {
        currentTab = "Me";
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'Clipstream!',
              style: GoogleFonts.pacifico(color: Colors.red),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
              child: Icon(
                Icons.settings,
                color: Color(0xFF696969),
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityScreen()),
                      );
                    },
                    child: Icon(
                      Icons.timeline_sharp,
                      color: Color(0xFF696969),
                    ),
                  )),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      child: RaisedButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        elevation: 0,
                        onPressed: () {
                          setState(() {
                            currentTab = "Everyone";
                            isEveryoneButtonPressed = true;
                          });
                        },
                        child: Text('EVERYONE',
                            style: TextStyle(color: isEveryoneButtonPressed ? Colors
                                .white : Colors.grey)),
                        color: isEveryoneButtonPressed ? Colors.red : Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      child: RaisedButton(
                        elevation: 0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          setState(() {
                            currentTab = "Me";
                            isEveryoneButtonPressed = false;
                          });
                        },
                        child: Text('ME',
                            style: TextStyle(color: isEveryoneButtonPressed
                                ? Colors.grey
                                : Colors.white)),
                        color: isEveryoneButtonPressed ? Colors.white : Colors.red,
                      ),
                    )
                  ],
                )
              ],
            ),
            ///Dropdown Button Here!
            Visibility(
            visible: currentTab == "Me",
              child: Container(
                child: DropDownButtonPage(),
              ),
            ),
            Visibility(
              visible: currentTab == "Me",
              child: Container(
                child: Gallery(),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30, right: 2),
          child: Visibility(
            visible: currentTab == "Everyone",
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CameraPreviewScreen()),
                );
              },
              child: Icon(Icons.camera_alt),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}