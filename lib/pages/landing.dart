import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './quiz_page.dart';
import '../ui/spinkit.dart';


class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue[700],
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
        
                child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           new SpinKit(),
           new Text("QUIZZ TIME!", style: new TextStyle(fontFamily:'Nunito',color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),),
           new Text("Tap to start", style: new TextStyle(fontFamily:'Nunito',color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.normal),),
        ]
      ),
     ),
    );
  }
}