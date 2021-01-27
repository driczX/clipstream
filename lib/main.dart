import 'package:clipstream/Pages/account_settings.dart';
import 'package:clipstream/Pages/activity.dart';
import 'package:clipstream/Pages/dropdownforimage.dart';
import 'package:clipstream/Pages/imagepicker.dart';
import 'package:clipstream/not_used_file/intro_page.dart';
import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/otpscreen.dart';
import 'package:clipstream/screen/camerapreview.dart';
import 'package:clipstream/test/cameratest.dart';
import 'package:clipstream/not_used_file/dropdowntest.dart';
import 'package:clipstream/test/localstorage.dart';
import 'package:clipstream/test/otpcode.dart';
import 'package:clipstream/test/timer.dart';
import 'package:clipstream/test/verificationtest.dart';
import 'package:clipstream/Pages/settings.dart';
import 'package:clipstream/test/setup.dart';

import 'package:clipstream/Pages/verification.dart';
import 'package:clipstream/Pages/welcome.dart';
import 'package:clipstream/contact/contactpage.dart';
import 'package:clipstream/contact/seeContact.dart';
import 'package:clipstream/screen/camera.dart';
import 'package:clipstream/screen/video.dart';
import 'package:clipstream/not_used_file/bottomsheet.dart';
import 'package:clipstream/test/homescreen.dart';
import 'package:clipstream/Pages/introscreen.dart';
import 'package:clipstream/Pages/usersetup.dart';
import 'package:clipstream/test/veriftest.dart';
import 'package:clipstream/Pages/verifyingsplash.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:clipstream/screen/camera.dart';
import 'package:clipstream/Pages/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Clipstream());
}

class Clipstream extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
          ),
          fontFamily: 'Rubik',
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ManagementScreen(),
      // PinCodeScreen(phoneNo: 6282118067233.toString()),
    );
  }
}





