import 'package:clipstream/Pages/account_settings.dart';
import 'package:clipstream/Pages/dropdown.dart';
import 'package:clipstream/Pages/imagepicker.dart';
import 'package:clipstream/not_used_file/intro_page.dart';
import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/otp.dart';
import 'package:clipstream/Pages/otpcode.dart';
import 'package:clipstream/Pages/otpscreen.dart';
import 'package:clipstream/Pages/settings.dart';
import 'package:clipstream/Pages/setup.dart';

import 'package:clipstream/Pages/verification.dart';
import 'package:clipstream/Pages/welcome.dart';
import 'package:clipstream/contact/contactpage.dart';
import 'package:clipstream/contact/seeContact.dart';
import 'package:clipstream/screen/camera.dart';
import 'package:clipstream/screen/video.dart';
import 'package:clipstream/not_used_file/bottomsheet.dart';
import 'package:clipstream/test/camerasave.dart';
import 'package:clipstream/test/homescreen.dart';
import 'package:clipstream/Pages/intro.dart';
import 'package:clipstream/test/multipicker.dart';
import 'package:clipstream/test/phonesetup.dart';
import 'package:clipstream/test/veriftest.dart';
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
        home: MyApp(),
      ///pincodescreen itu yang bawah
      // PinCodeVerificationScreen(6282118067233.toString()),
    );
  }
}

