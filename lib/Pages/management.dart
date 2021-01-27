import 'package:clipstream/Pages/dropdownforimage.dart';
import 'package:clipstream/Pages/imagepicker.dart';
import 'package:clipstream/screen/camera.dart';
import 'package:clipstream/screen/camerapreview.dart';
import 'package:clipstream/Pages/manageaudience.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_manager/photo_manager.dart';

///Management, Activity, Settings, Account_Settings here!
///Management done, Settings done, Account_Settings done, Activity 60%.

class ManagementScreen extends StatefulWidget {
  @override
  _ManagementState createState() => _ManagementState();
}

class _ManagementState extends State<ManagementScreen> {
  String currentTab;
  bool isEveryoneButtonPressed = false;
  int currentSelected;
  List<Widget> containerTest = List<Widget>();
  List<AssetEntity> value = List<AssetEntity>();
  Map<String, bool> isSelectedArray = {
    "a": false,
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      displayBottomSheet(context);
    });
    currentTab = "Me";
    currentSelected = 0;
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white.withOpacity(0.8),
        barrierColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    // alignment: Alignment.topCenter,
                    child: Text(
                        "Your snap taken with Clipstream Camera will appear here including pictures on your phone storage.",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                        Future.delayed(
                            const Duration(milliseconds: 3000),
                            () => showDialog(
                                  context: context,
                                  builder: (context) => AlertAudience(),
                                ));
                      },
                      // onPressed: (){
                      // Navigator.pop(context);
                      // },
                      child: Text('Got it',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                  ),
                ]),
          );
        });
  }

  Widget WhiteAppbar() => AppBar(
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
                    MaterialPageRoute(builder: (context) => ActivityScreen()),
                  );
                },
                child: Icon(
                  Icons.timeline_sharp,
                  color: Color(0xFF696969),
                ),
              )),
        ],
      );

  Widget GreenAppBar() => AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color(0xFF3CB371),
        title: Text(
          currentSelected.toString() + " Selected",
          style: GoogleFonts.sunflower(color: Colors.white),
        ),
        leading: GestureDetector(
          ///onTap icon close
          onTap: () {
            setState(() {
              currentSelected = 0;
              isSelectedArray = {
                "a": false,
              };
            });
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SettingScreen()),
            // );
          },
          //TODO: setstate currentSelected = 0
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              ///onTap icon edit
              onTap: () {
                //TODO: How to edit the selected image
                print("test123s");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => AccountSetting()),
                // );
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              ///onTap icon delete
              onTap: () {
                //TODO: How to delete the selected image
              },
              child: Icon(Icons.delete, color: Colors.white),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    if (currentTab == null) {
      setState(() {
        currentTab = "Me";
      });
    }
    print("Current Selected " + currentSelected.toString());
    // for (var i=0;i<value.length;i++)
    // {
    //   containerTest.add(new Container(
    //     child: Column(
    //       children: [
    //         Container(
    //           child: AssetThumbnail(
    //             asset: value[i],
    //             isSelected: false,
    //             id: value[i].id,
    //           ),
    //           color: Colors.black,
    //           height: 250,
    //           width: 400,
    //         ),
    //       ],
    //     ),
    //     color: Colors.blue,
    //     height: 300,
    //     width: 400,
    //     // child: ImageThrow(
    //     // ),
    //   ),
    //   );
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: currentSelected == 0 ? WhiteAppbar() : GreenAppBar()),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: RaisedButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        elevation: 0,
                        onPressed: () {
                          setState(() {
                            currentTab = "Everyone";
                            isEveryoneButtonPressed = true;
                            currentSelected = 0;
                            isSelectedArray = {
                              "a": false,
                            };
                          });
                        },
                        child: Text('EVERYONE',
                            style: TextStyle(
                                color: isEveryoneButtonPressed
                                    ? Colors.white
                                    : Colors.grey)),
                        color:
                            isEveryoneButtonPressed ? Colors.red : Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: RaisedButton(
                        elevation: 0,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          setState(() {
                            currentTab = "Me";
                            isEveryoneButtonPressed = false;

                            currentSelected = 0;
                            isSelectedArray = {
                              "a": false,
                            };
                          });
                        },
                        child: Text('ME',
                            style: TextStyle(
                                color: isEveryoneButtonPressed
                                    ? Colors.grey
                                    : Colors.white)),
                        color:
                            isEveryoneButtonPressed ? Colors.white : Colors.red,
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
                child: Gallery(
                  currentSelectedImage: this.currentSelected,
                  isSelectedArray: this.isSelectedArray,
                  pressedAppBar: (String id, bool result) {
                    print("123111 " + id + " " + result.toString());
                    int nextCurrentSelected = currentSelected;
                    if (result == true) {
                      nextCurrentSelected = nextCurrentSelected + 1;
                    } else {
                      nextCurrentSelected = nextCurrentSelected - 1;
                    }

                    var isSelectedArrayCopy = isSelectedArray;
                    print("000000 " + id + " " + isSelectedArray.toString());



                    if (isSelectedArrayCopy[id] == null){
                      isSelectedArrayCopy[id] = false;
                    }
                    print("123222 " + id + " " + isSelectedArrayCopy[id].toString());
                    isSelectedArrayCopy[id] = result;
                    print("123333 " + id + " " + isSelectedArrayCopy[id].toString());
                    setState(() {
                      isSelectedArray = isSelectedArrayCopy;
                      currentSelected = nextCurrentSelected;
                    });
                  },
                  imageThrow: (List<AssetEntity> selectedImages) {
                    for (var i = 0; i < selectedImages.length; i++) {
                      containerTest.add(
                        new Container(
                          child: Column(
                            children: [
                              Container(
                                child: AssetThumbnail(
                                  asset: selectedImages[i],
                                  hideSelectedBox: true,
                                  isSelected: false,
                                  id: selectedImages[i].id,
                                ),
                                height: 385,
                                width: 500,
                              ),
                              SizedBox(
                                width: 357,
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(0),
                                        child: Column(
                                          children: [
                                            Text("Edric",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 13),
                                              child: Text("Bandung",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF696969),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 150),
                                              child: Text("0 Comments",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF696969),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                            const EdgeInsets.only(left: 185),
                                              child: Text("0 Likes",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF696969),
                                                  )
                                              )),
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 10),
                                      //   child: Align(
                                      //     child: Text("Edric",
                                      //         overflow:
                                      //             TextOverflow.ellipsis,
                                      //         style: TextStyle(
                                      //           fontSize: 20,
                                      //           fontWeight: FontWeight.bold,
                                      //         )),
                                      //     alignment: Alignment.centerLeft,
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 10, top: 5)2,
                                      //   child: Align(
                                      //     child: Text("Bandung",
                                      //         style: TextStyle(
                                      //           fontSize: 15,
                                      //           color: Color(0xFF696969),
                                      //         )),
                                      //     alignment: Alignment.centerLeft,
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(bottom: 20),
                                      //   child: Align(
                                      //     child: Text("0 Comments"),
                                      //     alignment: Alignment.topRight,
                                      //   ),
                                      // ),
                                      // Align(
                                      //   child: Text("0 Likes"),
                                      //   alignment: Alignment.topRight,
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.only(),
                                        child: IconButton(
                                            icon: Icon(Icons.more_vert_sharp),
                                            iconSize: 30,
                                            color: Color(0xFF696969),
                                            onPressed: () {}),
                                      ),
                                      // Container(
                                      //   // TODO: buat text hard code nya ending user onboard
                                      //   child: Text("Edric",
                                      //   style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                      //   color: Colors.blue,
                                      //   height: 100,
                                      //   width: 500,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // child: ImageThrow(
                          // ),
                        ),
                      );
                    }
                    setState(() {
                      value = selectedImages;
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: currentTab == "Everyone",
              child: Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.blue,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            color: Color(0xFFF5F5F5),
                            child: Column(
                              children: containerTest,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: Theme(
        //   data: Theme.of(context).copyWith(
        //     canvasColor: Colors.transparent,
        //     primaryColor: Colors.red,
        // ),
        // child: Visibility(
        //   visible: currentSelected == 0 ? false : true,
        //   child: ButtonTheme(
        //     height: 64,
        //     child: RaisedButton.icon(
        //       icon: Icon(Icons.stacked_line_chart, color: Colors.white),
        //       onPressed: () => {
        //
        //       },
        //       color: Color(0xFF3CB371),
        //       textColor: Colors.white,
        //       label: Text('Stream it!',
        //       style: GoogleFonts.sunflower(fontSize: 25)),
        //     ),
        //   ),
        // ),
        // ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30, right: 2),
          child: Visibility(
            visible: currentTab == "Everyone",
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraButton()),
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


//TODO: Make the Activity Screen UI same as the flow.
class ActivityScreen extends StatefulWidget {
  final List<String> groups =['Family', 'Senja Slackers'];
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityScreen> {
  bool yesButton = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Icon(Icons.timeline_sharp, color: Colors.red),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ManagementScreen()),
              // );
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF696969),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.perm_contact_cal,
                    color: Color(0xFF696969),
                  ),
                )),
          ],
        ),
        body: Container(
          color: Color(0xFFF5F5F5),
          child: Column(
            children: [
              // Expanded(
              //   child:
              //   Container(
              //     color: Colors.amber,
              //       // color: Color(0xFFF5F5F5),
              //       width: 400,
              //       child: Column(
              //         children: [],
              //       )),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 370.0),
                child: Visibility(
                  visible: true,
                  child: Container(
                    height: 130,
                    width: 344,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                  ///If you want to use image from network use this code below.
                                  NetworkImage("https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg"),
                                  ///If you want to use image from assets use this code below.
                                  // AssetImage('assets/images/friends.png'),
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "Alice \n",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                          "shared clipstream with you. Do you want to \nadd it to your clipstream?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF696969),
                                          ),
                                        ),
                                      ])),
                              // Text("Alice", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                                color: Colors.white,
                                height: 40,
                                width: 350,
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: SizedBox(
                                          width: 65,
                                          child: FlatButton(
                                              onPressed: () {},
                                              color: Colors.white,
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 60.0),
                                        child: SizedBox(
                                          width: 65,
                                          child: FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  yesButton = !yesButton;
                                                });
                                              },
                                              color: Colors.white,
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 13),
                                              )),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: SizedBox(
                                          width: 113,
                                          child: FlatButton(
                                              onPressed: () {},
                                              color: Colors.red,
                                              child: Text(
                                                "Yes, add back",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13),
                                              )),
                                        ),
                                      ),
                                    ])),
                          )
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 130),
                child: Container(
                  color: Colors.white,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.access_time_rounded,
                            color: Color(0xFF696969)),
                      ),
                      Text("Activity history",
                          style: TextStyle(color: Color(0xFF696969), fontSize: 18))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingScreen> {
  bool _on = false;
  bool _switch = false;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Icon(Icons.settings, color: Colors.red),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    // Navigator.of(context).pushNamedAndRemoveUntil('AccountSettings', (Route<dynamic> route) => false);
                  },
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    color: Color(0xFF696969),
                  ),
                )),
          ],
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 180),
            child: Container(
              child: Text(
                'GENERAL SETTINGS',
                style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          SwitchListTile(
            activeTrackColor: Colors.greenAccent,
            activeColor: Colors.teal,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 105, bottom: 4),
                  child: Text('Geo location tagging',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 125),
                  child: Text('Include location meta',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),
              ],
            ),
            value: _on,
            onChanged: (value) => setState(() => _on = value),
          ),
          SwitchListTile(
            activeTrackColor: Colors.greenAccent,
            activeColor: Colors.teal,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100, bottom: 4),
                  child: Text('Low bandwidth mode',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 140),
                  child: Text('Loads snaps in HD',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),
              ],
            ),
            value: _switch,
            onChanged: (value) => setState(() => _switch = value),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 180),
            child: Container(
              child: Text(
                'ACCOUNT SETTINGS',
                style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 180, top: 10),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, right: 180),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Review / Edit Account',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccountSetting()));
                          },
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 155),
            child: Container(
              child: Text(
                'UPLOAD PREFERENCES',
                style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, right: 230),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Phone uploads',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, right: 160),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Over Wi-Fi or Mobile Network',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ]),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, right: 230),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Video uploads',
                        recognizer: TapGestureRecognizer()..onTap = () {
                        },
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, right: 70, bottom: 10),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Only when there is Wi-Fi connection available',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ]),
                ),
              ),
            ],
          ),
          CheckboxListTile(
            activeColor: Colors.teal,
            checkColor: Colors.white,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 130, bottom: 4),
                  child: Text('While charging only',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text('Uploads snaps only when a charger is connected',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),
              ],
            ),
            value: _check,
            onChanged: (value) => setState(() => _check = value),
          ),
        ]),
      ),
    );
  }
}

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  bool _on = false;
  TextEditingController _controller = TextEditingController(text: "");
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Account settings',
            style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SettingScreen()),
              // );
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF696969),
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 240),
            child: Container(
              child: Text(
                'FULL NAME',
                style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    child: Container(
                      width: 300,
                      child: TextField(
                        focusNode: myFocusNode,
                        controller: _controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: IconButton(
                        icon: Icon(Icons.edit),
                        // onPressed: () => myFocusNode.requestFocus(),
                        onPressed: () {
                          myFocusNode.requestFocus();
                          print('test123');
                        }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 200, bottom: 5),
            child: Container(
              child: Text(
                'PHONE NUMBER',
                style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          Column(children: [
            Container(
              padding: EdgeInsets.only(top: 10, right: 197, bottom: 15),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '+62 8211 8067 233',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ]),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 185, bottom: 10),
            child: Container(
              child: Text(
                'ACCOUNT PRIVACY',
                style: GoogleFonts.sunflower(color: Colors.red, fontSize: 17),
              ),
            ),
          ),
          SwitchListTile(
            activeTrackColor: Colors.greenAccent,
            activeColor: Colors.teal,
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 185, bottom: 4),
                  child: Text('Incognito',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                      "By turning this on, you won't appear to other user's contact list. This allows you to completely hidden from incoming clipstreams. But you stil can send snaps to other's clipstream",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                ),
              ],
            ),
            value: _on,
            onChanged: (value) => setState(() => _on = value),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 330,
                height: 50,
                child: RaisedButton(
                  onPressed: (){},
                  child: const Text('DEACTIVE ACCOUNT', style: TextStyle(fontSize: 20)),
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}


