import 'dart:io';

import 'package:clipstream/Pages/account_settings.dart';
import 'package:clipstream/not_used_file/intro_page.dart';
import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/test/setup.dart';
import 'package:clipstream/screen/preview.dart';
import 'package:clipstream/Pages/introscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraButton extends StatefulWidget {
  @override
  _CameraButtonState createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  CameraController controller;
  List cameras;
  int selectedCameraIndex;
  String imgPath;
  String videoPath;
  bool isSwitched;
  bool onRecording = false;
  bool cancelButton = true;
  bool videoButtonPressed = false;
  String dropdownValue;
  String albumName ='Media';

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final LocalStorage storage = new LocalStorage('clipstream_app');

  Future initCamera(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller =
        CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (controller.value.hasError) {
      print('Camera Error ${controller.value.errorDescription}');
    }

    try {
      await controller.initialize();
    } catch (e) {
      showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  /// Display camera preview
  Widget cameraPreview() {
    if (controller == null || !controller.value.isInitialized) {
      return Text(
        '',
        style: TextStyle(
            height: 17,
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  ///Icon and Button Here
  Widget cameraControl(context) {
    print(isSwitched);
    return Flexible(
      child: Container(
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              // color: Colors.red,
              width: 44,
              height: 44,
              child: FloatingActionButton(
                // color: Colors.red,
                child: Icon(
                  Icons.menu,
                  color: videoButtonPressed ? Colors.white : Color(0xFF696969),
                ),
                backgroundColor: videoButtonPressed ? Colors.transparent : Colors.white,
                elevation: 0,
                onPressed: () {},
                heroTag: null,
              ),
            ),
            SizedBox(
              width: 2,
            ),

            Container(
              // color: Colors.blue,
              width: 65,
              height: 65,
              child: Switch(
                // isSwitched = null ? Container() : isSwitched,
                  value: isSwitched == null ? false : isSwitched,
                  activeTrackColor: videoButtonPressed ? Colors.teal : Colors.greenAccent,
                  activeColor: Colors.teal,
                  inactiveTrackColor: Color(0xFFA9A9A9),
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      //print(isSwitched);
                    });
                  }),
            ),
            SizedBox(
              width: 20,
            ),

            Container(
              // color: Colors.greenAccent,
              width: 70,
              height: 70,
              child: FloatingActionButton(
                child: Icon(
                  videoButtonPressed ? onRecording ? Icons.stop : Icons.videocam : Icons.camera_alt,
                  color: videoButtonPressed ? Colors.red : Colors.white,
                  size: 35,
                ),
                backgroundColor: videoButtonPressed ? Colors.white : Colors.red,
                onPressed: () {
                  if (videoButtonPressed) {
                    if (onRecording) {
                      if (controller != null &&
                          controller.value.isInitialized &&
                          controller.value.isRecordingVideo) {
                        _onStopButtonPressed();
                      }
                      setState(() {
                        onRecording = false;
                      });
                    } else {
                      if (controller != null &&
                          controller.value.isInitialized &&
                          !controller.value.isRecordingVideo) {
                        _onRecordButtonPressed();
                      }
                      setState(() {
                        onRecording = true;
                      });
                    }
                  } else {
                    onCapture(context);
                  }
                },
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 40,
              height: 44,
              child: FloatingActionButton(
                backgroundColor: videoButtonPressed ? Colors.red : Colors.white,
                elevation: 0,
                onPressed: () {
                  setState(() {
                    videoButtonPressed = !videoButtonPressed;
                    cancelButton = !cancelButton;
                  });
                },
                child: Icon(
                  videoButtonPressed ? Icons.camera_alt : Icons.videocam,
                  color: videoButtonPressed ? Colors.white : Colors.red,
                ),
                heroTag: null,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            // Visibility(
            //   visible: true,
            //   child:
            Container(
              width: 44,
              height: 44,
              child: FloatingActionButton(
                child: Icon(
                  Icons.more_horiz,
                  color: videoButtonPressed ? Colors.white : Color(0xFF696969),
                ),
                backgroundColor: videoButtonPressed ? Colors.transparent : Colors.white,
                elevation: 0,
                onPressed: () {
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => Dropdown));
                },
                heroTag: null,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  ///Switch Camera System Here!
  Widget cameraToggle() {
    if (cameras != null && !cameras.isEmpty) {
      // return Spacer();
    }
    CameraDescription selectedCamera;
    CameraLensDirection lensDirection;
    if (cameras != null && !cameras.isEmpty) {
      selectedCamera = cameras[selectedCameraIndex];
      lensDirection = selectedCamera.lensDirection;
    }

    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: FlatButton.icon(
          onPressed: () {
            onSwitchCamera();
          },
          icon: Icon(
            getCameraLensIcons(lensDirection),
            color: Colors.white,
            size: 34,
          ),
          label: Text(''
            // '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
            // style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 9.0),
          ),
        ),
      ),
    );
  }

  onCapture(context) async {
    try {
      final p = await getExternalStorageDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";
      await controller.takePicture(path).then((value) {
        // await cameraController.takePicture(path).then((value) { aslinya
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => IntroScreen()),
        // );
        // print('here');
        print(path);
        GallerySaver.saveImage(path, albumName: albumName).then((bool success) {
          setState(() {
            print('Image is saved');
          });
        });
        //TODO: Change this to saving image in me tab.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoard(
              imgPath: path,
              fileName: "$name.png",
            ),
          ),
        );
      });
    } catch (e) {
      showCameraException(e);
    }
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {});
      } else {
        print('No camera available');
      }
      setState(() {
        isSwitched = false;
      });
    }).catchError((e) {
      print('Error : ${e.code}');
    });
    var items = storage.getItem('onboarding');
    print("tes init " + items.toString());
    _saveToStorage();
  }

  _saveToStorage() {
    storage.setItem('onboarding', DateTime.now());
  }
  @override
  Widget build(BuildContext context) {

    var items12 = storage.getItem('onboarding');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: FutureBuilder(
            future: storage.ready,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  cameraPreview(),
                  Positioned(
                    top: MediaQuery.of(context).size.height - 630.0,
                    left: MediaQuery.of(context).size.width - 80.0,
                    child: MaterialButton(
                      onPressed: () {

                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[SizedBox(width: 6), cameraToggle()],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: videoButtonPressed ? true : cancelButton,
                    child: Positioned(
                      top: MediaQuery.of(context).size.height - 630.0,
                      right: MediaQuery.of(context).size.width - 40.0,
                      child: IconButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close,
                            color: Colors.white,
                            size: 34,)),
                    ),
                  ),
                  //TODO: Build a local storage.
                  ///Text muncul tapi null, not complete yet.
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height - 330.0,
                  //   right: MediaQuery.of(context).size.width - 40.0,
                  //   child: Text(
                  //       items12.toString(),
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //       ),
                  //   ),
                  // ),
                  bottomContainerNav()
                ],
              );
            }
        ),
      ),
    );
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        Fluttertoast.showToast(
            msg: 'Recording video started',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            // timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white
        );
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      Fluttertoast.showToast(
          msg: 'Video recorded to $videoPath',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white
      );

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller.startVideoRecording(filePath);
      //      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        // timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

  Widget bottomContainerNav() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 112,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        color: videoButtonPressed ? Colors.black.withOpacity(0.5) : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            cameraControl(context),
            // Spacer(),
          ],
        ),
      ),
    );
  }

  getCameraLensIcons(lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
    // default:
    //   return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex =
    selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    if (cameras.length > 0) {
      CameraDescription selectedCamera = cameras[selectedCameraIndex];
      initCamera(selectedCamera);
    }
  }

  showCameraException(e) {
    String errortext = 'Error ${e.code} \nError message: ${e.description}';
  }

  ///Dropdown More Button
  Widget icon() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        Icons.timer.toString(),
        Icons.hd.toString(),
        Icons.flash_auto.toString()
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
