import 'package:clipstream/Pages/management.dart';
import 'package:clipstream/Pages/settings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
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
