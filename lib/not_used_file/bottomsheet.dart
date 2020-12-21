import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero, () {
      displayBottomSheet(context);
    });
  }

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.grey.withOpacity(0.8),
        barrierColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.4,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  // alignment: Alignment.topCenter,
                  child: Text("Your snap taken with Clipstream Camera will appear here including pictures on your phone storage.",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    color: Colors.red,
                    onPressed: (){
                    },
                    child: Text('Got it', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
          ]
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Click the floating action button to show bottom sheet.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
  }