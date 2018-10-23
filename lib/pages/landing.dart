import 'package:flutter/material.dart';
import './quiz_page.dart';


class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(

      color: Colors.blueAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
        child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           new Text("QUIZZ TIME!", style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
           new Text("Tap to start", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),),
        ]
      ),
     ),
    );
  }
}