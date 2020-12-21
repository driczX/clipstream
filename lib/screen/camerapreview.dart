import 'package:clipstream/Pages/account_settings.dart';
import 'package:clipstream/not_used_file/intro_page.dart';
import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/setup.dart';
import 'package:clipstream/screen/preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraPreviewScreen extends StatefulWidget {
  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;
  bool isSwitched;
  String dropdownValue;
  String albumName ='Media';

  var rating;

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } catch (e) {
      showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  /// Display camera preview
  Widget cameraPreview() {
    if (cameraController == null || !cameraController.value.isInitialized) {
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
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
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
                  color: Color(0xFFD3D3D3),
                ),
                backgroundColor: Colors.white,
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
                  activeTrackColor: Colors.greenAccent,
                  activeColor: Colors.teal,
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
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 35,
                ),
                backgroundColor: Colors.red,
                onPressed: () {
                  onCapture(context);
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
                child: Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                onPressed: () {},
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
                  color: Color(0xFF696969),
                ),
                backgroundColor: Colors.white,
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
        alignment: Alignment.centerLeft,
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

      await cameraController.takePicture(path).then((value) {
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ManagementScreen(
              // imgPath: path,
              // fileName: "$name.png",
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
    // TODO: implement initState
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
  }

  @override
  Widget build(BuildContext context) {
    ('media ' + MediaQuery.of(context).size.height.toString());
    ('media ' + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          cameraPreview(),
          Positioned(
            top: MediaQuery.of(context).size.height - 630.0,
            left: MediaQuery.of(context).size.width - 80.0,
            child: MaterialButton(
              onPressed: () {},
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
          bottomContainerNav()
        ],
      ),
    );
  }

  Widget bottomContainerNav() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 112,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        color: Colors.white,
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
