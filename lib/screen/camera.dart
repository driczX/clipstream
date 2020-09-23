import 'package:clipstream/screen/preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

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
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  Widget videoControl(context) {
    return Flexible(
        child: Container(
            color: Colors.transparent,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Container(
                width: 44,
                height: 44,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () {},
                ),
              ),
                ],
            ),
        ),
    );
  }

  ///Icon and Button Here
  Widget cameraControl(context) {
    bool isSwitched = false;
    print(isSwitched);
    return Flexible(
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // isSwitched = null ? Container() : isSwitched,
            // Container(
            //   // color: Colors.red,
            //   width: 44,
            //   height: 44,
            //   child: FloatingActionButton(
            //     child: Icon(
            //       Icons.menu,
            //       color: Colors.grey,
            //     ),
            //     backgroundColor: Colors.white,
            //     onPressed: () {
            //     },
            //   ),
            // ),
            Container(
              // color: Colors.blue,
              width: 65,
              height: 65,
              child: Switch(
                  value: isSwitched,
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  }),
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
            // SizedBox(
            //   width: 10,
            // ),
            // Container(
            //   width: 44,
            //   height: 44,
            //   child: FloatingActionButton(
            //     child: Icon(
            //       Icons.videocam,
            //       color: Colors.red,
            //     ),
            //     backgroundColor: Colors.white,
            //     onPressed: () {},
            //   ),
            // ),
            // Container(
            //   width: 44,
            //   height: 44,
            //   child: FloatingActionButton(
            //     child: Icon(
            //       Icons.more_horiz,
            //       color: Colors.grey,
            //     ),
            //     backgroundColor: Colors.white,
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  ///Switch Camera System Here!
  Widget cameraToggle() {
    if (cameras == null || cameras.isEmpty) {
      // return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

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
          label: Text(
            ''
            // '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
            // style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 9.0),
          ),
        ),
      ),
    );
  }

  onCapture(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";

      await cameraController.takePicture(path).then((value) {
        print('here');
        print(path);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PreviewScreen(
                      imgPath: path,
                      fileName: "$name.png",
                    )));
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
    }).catchError((e) {
      print('Error : ${e.code}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          cameraPreview(),
          Positioned(
            top: 20.0,
            left: 275,
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
                  children: <Widget>[
                    SizedBox(width: 6),
                    cameraToggle()
                  ],
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
        height: 120,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[ 
            cameraControl(context),
            // videoControl(context),
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
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    initCamera(selectedCamera);
  }

  showCameraException(e) {
    String errorText = 'Error ${e.code} \nError message: ${e.description}';
  }
}
