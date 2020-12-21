import 'package:flutter/material.dart';
import 'helperfunction.dart';

// class SmsButton extends StatefulWidget {
//   @override
//   _SmsButtonState createState() => _SmsButtonState();
// }
//
// class _SmsButtonState extends State<SmsButton> {
//   bool _check = false;

class SmsButton extends StatelessWidget {
  const SmsButton({Key key, @required this.phoneNumbers}) : super(key: key);

  final Iterable phoneNumbers;

  @override
  Widget build(BuildContext context) {
     return IconButton(
     icon: Icon(Icons.message),
     onPressed: onSmsButtonPressed(context),
    );
    //  CheckboxListTile(
    //   activeColor: Colors.teal,
    //   checkColor: Colors.white,
    //   title: Column(children: [
    //     Padding(
    //       padding: const EdgeInsets.only(right: 130, bottom: 4),
    //       child: Text('While charging only',
    //           style: TextStyle(color: Colors.black)),
    //     ),
    //   ]),
    //   // value: _check,
    //   // onChanged: (value) => setState(() => _check = value),
    // );
  }

  Function onSmsButtonPressed(BuildContext context) {
    String number = HelperFunctions.getValidPhoneNumber(phoneNumbers);
    if (number != null) {
      return () {
        HelperFunctions.messagingDialog(context, number);
      };
    } else {
      return null;
    }
  }
}
