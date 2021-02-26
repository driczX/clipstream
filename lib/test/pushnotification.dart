import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotif extends StatefulWidget {
  String get title => "Flutter Home Page";

  @override
  _PushNotifState createState() => _PushNotifState();
}

class _PushNotifState extends State<PushNotif> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationAlert,
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (message) async{
        setState(() {
          messageTitle = message["notification"]["title"];
          notificationAlert = "New Notification Alert";
        });

      },
      onResume: (message) async{
        setState(() {
          messageTitle = message["data"]["title"];
          notificationAlert = "Application opened from Notification";
        });

      },
    );
  }

}
