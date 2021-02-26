import 'package:clipstream/test/singlechoicedata.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class SingleChoice extends ChangeNotifier {
  String _currentGroups = groups [0];
  SingleChoice();

  String get currentGroups => _currentGroups;
  updateGroups(String value){
  if(value != _currentGroups){
    _currentGroups = value;
    notifyListeners();
  }
  }
}
