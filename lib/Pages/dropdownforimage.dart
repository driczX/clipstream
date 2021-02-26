import "package:flutter/material.dart";

class DropDownButtonPage extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonPage> {
  // String dropdownValue;
  // bool selectedDropdown = false;
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
            value: "3",
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
        dropdownColor: Color(0xFFF5F5F5),
        iconEnabledColor: Color(0xFF696969),
        isExpanded: true,
      );

  @override
  Widget build(BuildContext context) {
    // DropdownButton dropDownOption;
    // if (dropdownValue == 'Unpublished'){
    //   dropDownOption = "UNPUBLISHED" as DropdownButton;
    // } else if (dropdownValue == 'Published'){
    //   dropDownOption = "PUBLISHED" as DropdownButton;
    // } else {
    //   dropDownOption = "ALL" as DropdownButton;
    // }
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFF5F5F5),
              alignment: Alignment.centerLeft,
              child: _normal2Down(),
            ),
            SizedBox(height:0)
          ],
        ),
      );
  }
}

