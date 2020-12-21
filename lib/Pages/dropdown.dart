import "package:flutter/material.dart";
// import 'package:flutter_widgets/const/_const.dart';

class DropDownButtonPage extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonPage> {
  var _value = "1";

  DropdownButton _normal2Down() => DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            value: "1",
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "ALL",
                style: TextStyle(
                  color: Color(0xFF696969),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: "2",
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "PUBLISHED",
                style: TextStyle(
                  color: Color(0xFF696969),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: "2",
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "UNPUBLISHED",
                style: TextStyle(
                  color: Color(0xFF696969),
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        value: _value,
        elevation: 0,
        style: TextStyle(color: Colors.black, fontSize: 30),
        isDense: true,
        iconSize: 40.0,
        dropdownColor: Color(0xFFEEECEC),
        iconEnabledColor: Color(0xFF696969),
        isExpanded: true,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFEEECEC),
              alignment: Alignment.centerLeft,
              child: _normal2Down(),
            ),
            SizedBox(height:0)
          ],
        ),
      );
  }
}

