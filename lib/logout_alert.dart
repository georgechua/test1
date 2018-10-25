import 'package:flutter/material.dart';

class LogOutALert extends StatefulWidget {
  @override
  _LogOutALertState createState() => _LogOutALertState();
}

class _LogOutALertState extends State<LogOutALert> {

  String _text = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Log Out Confirmation"),
      ),

      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget> [
              new TextField(),
              new RaisedButton(onPressed: null),
            ],
          )
        ),
      )
    );
  }
}